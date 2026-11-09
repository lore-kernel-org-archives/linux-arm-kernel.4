Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEC606D81B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z/V86wSN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qjzmi6Gx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=; b=Z/V86wSNuErBG2
	SuHRAWUVsSwUP/BPZPzY3Gh0z3TwKIsHwcTwRNmp0bEWitbrqzPu1UF25VdDFVLKVc0SfNUSZEgCy
	8920lOvSj6kKAnd3Ycrk5kBjF+vqpi35BJhpx8X5VqwUrKLFzACRjFmzCtpO4fH7dRH1vsEbh3RWp
	BX8TQTW8ntOuXsQTxHmYGMWQWhBuLESvVHT8K5xOmjok4NSE53Z/XOWMSUE+QWq5+VbGQBK3SHRqA
	KE4uN2ZVAia4+JTGRCwRQVIDjc3aZnRnWHB+NfL+rDQlFZH3UjPGMSq+kw/X6ulfBdGd9bsqN9mYw
	bdyqslwnuxcZXE2hWNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOa-00000000nb8-0N1I;
	Mon, 09 Nov 2026 13:26:48 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPOX-00000000nZk-3ppW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:26:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8b2382bf051so426894b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230805; x=1794835605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
        b=Qjzmi6GxlqtPR/yvqSBuwsy5DR5QG/3PzJFFIB8x8ya9OJpExn2vm6NCVTXPp5jmz3
         tafalNGLpcS3oelwWBvRrcwdO7omjMfzZcg0C8+OSYxRcIVG2rwl0ZgNfX3WBMIMtQg6
         zc4RVPlk87nGa6Dut3waN5pi1b1IkpoM0Q2SyhWSr8oqNa8fo1dF9XJh+O6eWnDJ8vz+
         OXTWSnWS9enyxPpQMTFlfK/TXRnymrz4HjRcZbSdYK3y8z2cSD9yhpjhwHUhBTUNmBbc
         GFVFi5cRaRIHzav7mrsRitCCjxPoHIT9bmIyYZQsvv96axFgaGWrgPDAKbHoLtgBsAMt
         GDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230805; x=1794835605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wb36d59tOa1goucfW7M19URtNZys+/DAbWnPAmZ/x54=;
        b=APsVtqYx867Yfu/2hVOCtmClBYnThGjWymPRa2JZZ4PLSoke7jP7p+pVB15zBMj+sx
         CTiPgacsn5kKMRlg4WxEuU2u4LlinnO+/L/1HB2sI51QdGl5/lxr5Pue1KuerpFWW2As
         Ka/l2Cv7pkAjBQ+W+a8hLEEJ2XWjTFS+lvN2gZCE/fcFRys9lLuNR4M+tiECquWdAvH1
         ICJK4wF4A/X+2Fdg/RpN63GsvjqR+mv4RDju6fu2x7Weh4bPfoVuScnBx9A+yhLn5jao
         5rMXZmoL3TQhYEl8wpmm9fpJjwX0UZI8o6yKkOJJ1SV6QqYigOO+5AclGRcj1npoGR2w
         CIsA==
X-Forwarded-Encrypted: i=1; AL+hErHhGMT3al9FDi2yrao65AonzO6tw4R5ooxcNkscgRapF8dNaiM6yuvH+5ZSSLLe6PKolRd1yxc67dqXJiFzxRo2@lists.infradead.org
X-Gm-Message-State: APuU4Z9OyDCHs1j3GPocru1mT00EO3iIF0MiNIQqmchKxHkTVCchk+kS
	rJlojtkaZCyBVSfxiaGshlT1erFeQ/xrZ9TCABeEfKW51nMQtxoKUMIh
X-Gm-Gg: AYBFou1Bvxbq4I6GtssF6dd9lNdT0pmQ68RnAvFFYvU068V9NA2H49kGD3jeD9QLV2U
	WeQR3Kddd6znYXX11xZwKlvEYIO7ikSm0Lg70Tow3CnRJ1S8k5sawuTr7pU7xj5ccFI3gqTGGVb
	6l5DSKgiTjEh0yYTJuiOgG5DY8xJcbllADA16CjrT7Z81wMzAL/XMT0w9eviqZxi0rEZNH063g9
	xWoBqHZzJHYqdmsHmltyKbUfbBxA1/yaD7ymLTQWpK5sxNtY8WDsErVmo6e8Xm/L7/VucHkqn3X
	1TDxImGvP7I/NnLPBkA0JYWP99V8V59BSCqS6eY3xkEC6HJTIkW+qI1zUYsfPGcLqKECDqxJp3j
	FfP99n+uPOek9C+Int6WaM/cE95HtQvHlNgps0Lbs77KucrN0rxwENhXR8dR8V8qDwT8O7CDC0B
	i0SZVgtSCPleGSOADS+z4ZJ7e/8ZuWvgm5Tf/P1wslEB0Yj0NCAwPYw6fWnZoYZQ2VlxuMh2i4E
	QOXKmWWxY1sLu5wX9diBjVT0M+Lq73mB2SKoLS3eINluf+VCUZ7pZSwHPSMj+tRLP4Gvbu9ohHw
	AXXGfT52vN6h/sPzDUTYsfsC465PBNTma5MlqTf+93qtFzi/MXFXGJoIeB1pkqVvZCeN+sxQCsU
	dbwSJiMg9
X-Received: by 2002:a05:6a21:8217:b0:3e1:c716:3a00 with SMTP id adf61e73a8af0-3eed3013545mr4660990637.53.1794230804815;
        Mon, 09 Nov 2026 05:26:44 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:44 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 2/6] fs/resctrl: Do not update bandwidth from a failed counter read
Date: Mon,  9 Nov 2026 21:26:17 +0800
Message-ID: <20261109132621.3862497-3-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052645_960318_5B259C47 
X-CRM114-Status: GOOD (  16.37  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jinjie Ruan <ruanjinjie@huawei.com>

mbm_update_one_event() reads a monitoring group's counter once per
second and updates the bandwidth used by the MBA software controller
through mbm_bw_count().

When the read fails, rmid_read::err is set and the accumulated counter
value stays zero, but mbm_bw_count() runs anyway. Subtracting the
previous sample from zero wraps to a huge value, which becomes the
group's bandwidth; the controller then moves the control the wrong
way. The failure is reachable with assignable counters, where a group
has no counter for the event once the shared pool is exhausted.

Update the bandwidth only when the read succeeded. A failed read keeps
the previous bandwidth; the counter keeps accumulating, so the next
successful sample spans the failed interval and is larger. The
controller steps down once and recovers on the next round.

Fixes: 2c272fadb58b ("x86/resctrl: Compute memory bandwidth for all supported events")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # v6.14+
---
 fs/resctrl/monitor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index dbc6770508e6..2319e8e619bd 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -788,10 +788,11 @@ static void mbm_update_one_event(struct rdt_resource *r, struct rdt_l3_mon_domai
 	__mon_event_count(rdtgrp, &rr);
 
 	/*
-	 * If the software controller is enabled, compute the
-	 * bandwidth for this event id.
+	 * If the software controller is enabled, compute the bandwidth for
+	 * this event id. Do not update it when the counter could not be read:
+	 * that would store a bogus zero sample as the previous bandwidth.
 	 */
-	if (is_mba_sc(NULL))
+	if (is_mba_sc(NULL) && !rr.err)
 		mbm_bw_count(rdtgrp, &rr);
 
 	if (rr.arch_mon_ctx)
-- 
2.43.0


