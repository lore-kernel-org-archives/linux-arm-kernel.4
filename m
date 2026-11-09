Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A3A606D803
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RfYSci72;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OqcRsjUK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qECIJQpjfuH1ZjZJ/r1/HeSCxlIyRoe7mrKRIpv1eYs=; b=RfYSci72J9X9aL
	1QMtd3ls8+6fDVztuSD9h7jpcZzAZt0YB3faY4msKRlFn4QRYWlAPEgpEaoE+vGzorEWb4rrKFXtK
	l7rB6euNbFjBpttBKCRl7X3sgzDlRm+hQXqJmSm9MXlolzhUY/WoYWXC8hibHn2yqTDMgQfZVLpYt
	9FR+M6rO45qF5kLadlqXsnKMj+d3GDEryCqrWjtMS8swbembVkXtArectBRYbNbshLxfOMPl5Of8u
	zW4GBayNXRPSZL9KgF7+OAiJ+f0lilfkH0BMuiyWdywTwX6LRURYWpGqi22VhEwnkuDCTtqbIRhpK
	VGz2xCuxuAfFgZfZXzKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTL-00000000BWI-2cl6;
	Mon, 09 Nov 2026 09:15:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQLTG-00000000BRU-2V8p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 09:15:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA19414BF;
	Mon,  9 Nov 2026 01:15:18 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 170393FA1F;
	Mon,  9 Nov 2026 01:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794215721; bh=/SQydrJmcQbyexqcY63QR4hJ8qgiHzXl7qLMR3pL2Cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OqcRsjUKCFarqs1OPwOFJe2SGULKKYmiJ2Hbr7SsvyX0zFkxSbXGbyGgsGW15xOsr
	 nvDNPF/JoCJUh09CNxEF0qRfZnnS9RfIGWqRMUvz7UQlZE/HQ/MIK1qADHXe7iLQ+n
	 /UTlB983uuKBKPG0pZTAUkjUDh3aMIvc9kcob30A=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v15 08/35] include: trace: Add Telemetry trace events
Date: Mon,  9 Nov 2026 09:11:54 +0000
Message-ID: <20261109091221.2532706-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_011522_681153_DBDAB8CB 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add custom traces to report Telemetry accesses and collection events.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v12 --> v13
 - better commit message
 - use const char where required
v7 --> v8
 - use proper FTRACE helpers for variable strings
---
 include/trace/events/scmi.h | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/trace/events/scmi.h b/include/trace/events/scmi.h
index b421c253df00..ae63a13fd141 100644
--- a/include/trace/events/scmi.h
+++ b/include/trace/events/scmi.h
@@ -178,6 +178,51 @@ TRACE_EVENT(scmi_msg_dump,
 		  __get_str(tag), __entry->msg_id, __entry->seq, __entry->status,
 		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
 );
+
+TRACE_EVENT(scmi_tlm_access,
+	TP_PROTO(u64 de_id, const char *tag, u64 startm, u64 endm),
+	TP_ARGS(de_id, tag, startm, endm),
+
+	TP_STRUCT__entry(
+		__field(u64, de_id)
+		__string(tag, tag)
+		__field(u64, startm)
+		__field(u64, endm)
+	),
+
+	TP_fast_assign(
+		__entry->de_id = de_id;
+		__assign_str(tag);
+		__entry->startm = startm;
+		__entry->endm = endm;
+	),
+
+	TP_printk("[%s] de_id=0x%llX - startm=%016llX endm=%016llX",
+		  __get_str(tag), __entry->de_id, __entry->startm, __entry->endm)
+);
+
+TRACE_EVENT(scmi_tlm_collect,
+	TP_PROTO(u64 ts, u64 de_id, u64 value, const char *tag),
+	TP_ARGS(ts, de_id, value, tag),
+
+	TP_STRUCT__entry(
+		__field(u64, ts)
+		__field(u64, de_id)
+		__field(u64, value)
+		__string(tag, tag)
+	),
+
+	TP_fast_assign(
+		__entry->ts = ts;
+		__entry->de_id = de_id;
+		__entry->value = value;
+		__assign_str(tag);
+	),
+
+	TP_printk("[%s] ts=%llu de_id=0x%04llX value=%016llu",
+		   __get_str(tag), __entry->ts, __entry->de_id, __entry->value)
+);
+
 #endif /* _TRACE_SCMI_H */
 
 /* This part must be outside protection */
-- 
2.54.0


