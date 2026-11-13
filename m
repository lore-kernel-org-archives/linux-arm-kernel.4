Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC68606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2WcL5S6r;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bXWtZDSW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G+i/0NLBoO/HEsMkMFukqdBY1Hz7HkalsdJwK1TujE4=; b=2WcL5S6rxheNrD
	IPGQetZ/WrVWlxRd/x7AhRgsdcH9aEJ62XFVEXxFFO7AutFa001dc8JSNPZkhVDe1apTq7wvyFojZ
	6C1VumNKPFHzKE+WlrGXzf9E4PYPdbO9jxKd5DJWqe+69FlL7KOGpBOSdMo3dtL16mYD4D29kAasl
	mtf6ffzrnf2qyurFijVz01uYgOH8CEZRx8I+w9fwogsL1B0JoGbtKAe4F3lBGc1QsoE+DKkcZXlzo
	ijvxicRmZc9Qq1B4MUVf/K3mAZghneoyqABU3UwT0jGaF5j0VHfyF2sDsjJ1g4rpwKdO4+RQz423d
	ROECNLKuYKVlUBzRiMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRow5-0000000CQOR-0UKp;
	Fri, 13 Nov 2026 10:55:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRow2-0000000CQN9-0IvN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:55:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 324BD1C01;
	Fri, 13 Nov 2026 02:55:06 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 980AE3F959;
	Fri, 13 Nov 2026 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794567309; bh=Ug/YvNCHA537OQRpZAas6fYaW5Dfc/Tcowy6PWiZB7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bXWtZDSWL137vDcfGZQj+l6Uf+V2+O0es9IGrWcRKkVhFxzAlwSAAft/hgqJwVU3S
	 7mfDHIu1Nt6DfjPDOitJeMlAkuHGp2CQvmdqbyhLL5Qmab02BcNA5I882Sk8PNno60
	 d+Wa5ac1RmHyIMpEW0LRMEnP76mOmuvqWGpcH4wc=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 13 Nov 2026 10:54:54 +0000
Subject: [PATCH 3/3] perf cs-etm: Check frontend instruction reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-perf_fix_gcc15_failure-v1-3-eae592c5ff64@arm.com>
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Robert Walker <robert.walker@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567301; l=6176;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ug/YvNCHA537OQRpZAas6fYaW5Dfc/Tcowy6PWiZB7M=;
 b=PSLkP4wBNkvY0iGSa5qNaU5ds7m1E0frFfVtQOWHnleeuPkwsoooMayojTVUm+EkfC/SActCA
 ZQe8pROOBAyDQQ5aHmH1tFls/t6lJ0dpLk2imWvyP3tlPEeKhizEAAF
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025510_208277_88B741F9 
X-CRM114-Status: GOOD (  16.86  )
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

Frontend instruction decoding needs a complete memory read rather than
a byte count. Refactor cs_etm__frontend_mem_access() to return zero for
a complete read and -EIO otherwise, while retaining the decoder memory
callback's byte-count interface.

Propagate read errors through Thumb instruction size and address
calculation. Skip samples whose addresses cannot be determined while
preserving instruction period accounting, branch synthesis and packet
processing.

Initialize the copied instruction length to zero, validate the size,
and set the length only after reading all instruction bytes. Also check
read errors before recognizing SVC instructions.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 75 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 312d4a734e84faa0d24c4ac1fee16f4dae4c2398..303e16a54445bc62ce1c7d0e4ffeb1819211fd40 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1218,13 +1218,16 @@ static u32 __cs_etm__mem_access(struct cs_etm_queue *etmq,
 	return ret;
 }
 
-static u32 cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
+static int cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
 				       struct cs_etm_traceid_queue *tidq,
 				       struct cs_etm_packet *packet,
 				       u64 address, size_t size, u8 *buffer)
 {
-	return __cs_etm__mem_access(etmq, address, size, buffer, 0, packet->el,
-				    tidq->frontend_thread);
+	if (__cs_etm__mem_access(etmq, address, size, buffer, 0, packet->el,
+				 tidq->frontend_thread) != size)
+		return -EIO;
+
+	return 0;
 }
 
 static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
@@ -1370,9 +1373,12 @@ static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
 					 struct cs_etm_packet *packet, u64 addr)
 {
 	u8 instrBytes[2] = { 0 };
+	int ret;
 
-	cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
-				    ARRAY_SIZE(instrBytes), instrBytes);
+	ret = cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+					  ARRAY_SIZE(instrBytes), instrBytes);
+	if (ret)
+		return ret;
 	/*
 	 * T32 instruction size is indicated by bits[15:11] of the first
 	 * 16-bit word of the instruction: 0b11101, 0b11110 and 0b11111
@@ -1429,7 +1435,11 @@ static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
 		return addr + offset * 4;
 
 	while (offset) {
-		addr += cs_etm__instr_size(etmq, tidq, packet, addr);
+		int size = cs_etm__instr_size(etmq, tidq, packet, addr);
+
+		if (size < 0)
+			return CS_ETM_INVAL_ADDR;
+		addr += size;
 		offset--;
 	}
 	return addr;
@@ -1560,31 +1570,31 @@ static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
 			      struct cs_etm_packet *packet,
 			      struct perf_sample *sample)
 {
+	int size;
+
+	sample->insn_len = 0;
+
 	/*
 	 * It's pointless to read instructions for the CS_ETM_DISCONTINUITY
 	 * packet, so directly bail out with 'insn_len' = 0.
 	 */
-	if (packet->sample_type == CS_ETM_DISCONTINUITY) {
-		sample->insn_len = 0;
+	if (packet->sample_type == CS_ETM_DISCONTINUITY)
 		return;
-	}
 
-	sample->insn_len = cs_etm__instr_size(etmq, tidq, packet, sample->ip);
+	size = cs_etm__instr_size(etmq, tidq, packet, sample->ip);
 
 	/*
 	 * The instruction length should always fit within sample->insn,
 	 * but check it to prevent an out-of-bounds write.
 	 */
-	if (sample->insn_len > sizeof(sample->insn)) {
-		sample->insn_len = 0;
+	if (size <= 0 || (size_t)size > sizeof(sample->insn))
 		return;
-	}
 
-	if (packet->sample_type == CS_ETM_EXCEPTION && !sample->insn_len)
+	if (cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
+					size, (void *)sample->insn))
 		return;
 
-	cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
-				    sample->insn_len, (void *)sample->insn);
+	sample->insn_len = size;
 }
 
 u64 cs_etm__convert_sample_time(struct cs_etm_queue *etmq, u64 cs_timestamp)
@@ -2011,11 +2021,13 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
 			 */
 			addr = cs_etm__instr_addr(etmq, tidq, tidq->packet,
 						  offset - 1);
-			ret = cs_etm__synth_instruction_sample(
-				etmq, tidq, tidq->packet, addr,
-				etm->instructions_sample_period);
-			if (ret)
-				return ret;
+			if (addr != CS_ETM_INVAL_ADDR) {
+				ret = cs_etm__synth_instruction_sample(
+					etmq, tidq, tidq->packet, addr,
+					etm->instructions_sample_period);
+				if (ret)
+					return ret;
+			}
 
 			offset += etm->instructions_sample_period;
 			tidq->period_instructions -=
@@ -2227,8 +2239,11 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * so below only read 2 bytes as instruction size for T32.
 		 */
 		addr = ret_addr - 2;
-		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
-					    sizeof(instr16), (u8 *)&instr16);
+
+		if (cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+						sizeof(instr16), (u8 *)&instr16))
+			return false;
+
 		if ((instr16 & 0xFF00) == 0xDF00)
 			return true;
 
@@ -2243,8 +2258,11 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * +---------+---------+-------------------------+
 		 */
 		addr = ret_addr - 4;
-		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
-					    sizeof(instr32), (u8 *)&instr32);
+
+		if (cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+						sizeof(instr32), (u8 *)&instr32))
+			return false;
+
 		if ((instr32 & 0x0F000000) == 0x0F000000 &&
 		    (instr32 & 0xF0000000) != 0xF0000000)
 			return true;
@@ -2260,8 +2278,11 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
 		 * +-----------------------+---------+-----------+
 		 */
 		addr = ret_addr - 4;
-		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
-					    sizeof(instr32), (u8 *)&instr32);
+
+		if (cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
+						sizeof(instr32), (u8 *)&instr32))
+			return false;
+
 		if ((instr32 & 0xFFE0001F) == 0xd4000001)
 			return true;
 

-- 
2.34.1


