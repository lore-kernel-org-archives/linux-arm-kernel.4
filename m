Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGZ1UT89;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XXg5WRKa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUF1LCP7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=; b=YGZ1UT89IHeOrZ
	tLYXuX6HRdQG0KG9MVE0JaHz/TUPQ/h7YC2JoL364/cn9r6onWVCzBgPz5LvQhdHjaZnSq1cQCMfP
	l7c1isESBs/1kY3rF9JN3Q2POsTHl1BQrEX9UvoKlil4nZzLCCGGuUP3O5ZYUVMmkRxM4yA9z2mVa
	pvWxxQIeDzh3YMLEC+QGWLuo2k95F9BR0PDbM3voYuBLxHrE+KpfUTyRSYDnZ+hPy0DllO3GaBkTd
	0Neq3z6CnWPAZ3Enok4ttQoy19ei+n1X3yCETqhyED+90u+bGT6JK7Rva9lq4cQQxzUY+4Yt+JjyB
	BnaFj+1PBLw43HlEdexg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEU-0000000ELBr-1C5n;
	Thu, 26 Nov 2026 19:34:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDv-0000000EK6H-21oJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=; b=XXg5WRKawZzAq/elMfCgoBFVoS
	Jz/cDJ6gcz2ElAenArRtKatftV1mu4AfEiKLrHcPEz/BCmMos/jfouLR6OwxK9r8FsZSuh2m1J1+K
	KoQ21R+7NBMZdwPcVma6RmkGEpiCttsTVBbkCooxUYy15J6TeVCS7r6vs2bMI1V4ujQDwnxNxuwiX
	C7nRQq+h/o2zuGBurrWFkaXCTIc+lzJzjSM8ylLP5UMVvr2PBC6s98cfKw0370Ybx63oCLie5TUGc
	8bM3UZYDV2ToIL/I3RGQdAUqgeaknblk68GjcJ1fw9Shj8RMF6NhEj5ot5SEGR4Wxy6Be8HE8Qf8C
	M1kV5Ejg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDq-0000000700D-3u40
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so75639905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721613; x=1796326413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=;
        b=DUF1LCP7w75f4dgZqzCctLdlHnIfLLW38uJvQmXLABUYoaOApb37Nz+aYqpMS55FEj
         KdpiSKQGn9v8DJsMnoc8tME6C/3m+fntHd341MEkcJD81sZssHON/eHPSkewCjK4Tu2d
         qH+jaxsxU5CwYKFrOxI7wYaakt2jllpBxKUg9zK27vNyRELuB6fHugaT9UmzTRuDw3U+
         dmFJufTv8KaIpH6huPasGE1hjlEYPQVSWggLOhyZ9WbHRjI5euEi3sRL8kJ5IidWxf88
         XRPCSfwuYTwvTUZPHyWdy/l3/uhPKzaiobP+8WX7piiUNFUXJ/mod+XKJt1JuPzQkYPG
         cJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721613; x=1796326413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrCPEDuRLj9X86b6iS7crxRsYz+wud1Y8dJ9yChy4/Q=;
        b=Qw96ntE4OLQvM31MH/k+7bK2879PFdOC1eYgbnj2gbUMYOn611Mt471lTa4Zu/IWQg
         8Dr0d7BjMLc9JknVHeruWmKhx0jMc3tSn/R5Lzxh0sC9b09vF2CaimbxE/hfaePdNxZp
         TFd41rINIu7umWWxhWrIzwKq6CIDq8oxhVLGQ361ma/ogSDCSBTrRNPNnO4MwJeTQv6T
         7NeM3w0eF6ilGDOFJDl625XCKPdpQFKgQ5llPdH5BYuArGIXD5czq1NVvKhQMVocdKsf
         OfzbwEoQU8CphiyeJz3r77X9/erckuI88cI15PY49jdeBE4mqFHt+6zrJwMHQaA2dbFI
         HfSQ==
X-Forwarded-Encrypted: i=1; AL+hErF/PbVj6OUPGb8uWxGwisBJGCtWowggwRRdY7UyQgxTP+IxWVMhv2t9s/a55atLJAvpjZwrjr1/k7/VHR/njJaL@lists.infradead.org
X-Gm-Message-State: APuU4Z/AT93jXxRIhWzBxpssrmlZMlTwIfN77TLapfaC7/IqQrKv6Nun
	/+BcfG0yd6yqLbD5s9wIYRvnLL4mS1UF49+31J99iBh0mZbPs7CGrcLv
X-Gm-Gg: AZFdTZe2I92cFk1Z+5YVvSeM4t+NBU2Eiipfs9T9iplOZE4giQDbwOWjL7h0Ts0nwig
	bLXBEsa+DE2wWXZDXq8OKkKmDhl7v5eQ5x5SXaM1GRuG4hlRHBGLshrgfKDziWE4y3i6byNgPGO
	fPMgEGj442sF/+D7tjyUc6h4G+Ft91KPtKHrLN7DtY8sigUNTOcKTmByXfa2mOmRLDiaxvs1+9s
	ps6g4CEMjvZiss0BmveSvd8buB/SS7oGgRaPq9yX9POjz4T6AqU4MOHbfeoNu8r41bBtQZlTEt8
	BLpmaK8ux6T2Ng3Go74yncsOON6r+FMXnZWpX1glxQ8I1iaOA/1/2xUCs3DCj5mQ8ho39vVQUif
	iQpA67flIEHVD/RIdjKUdNYD6+RKzafsnVBYJPph9Q+dV39h54fMcg+8TDm5lVki6AUMlFtlZJu
	IXtVxqv5qXWdWzSpm2Sr1MVLjYEewcTVN+M0BlsAyct+Q19RUrxSD4muxZw82sqInPfUWhJ6Gy6
	VKiS7vPmx5NJrL6RfB7GPPXP37E1VeNDDrh85LHrmImCJNpTUn1l3LvBg+COthmc2Iq6ukk7wxM
	AVmyB0n1C1Stc8Z1NrNpsk9cgp1CAnwwG5PYGccSqLILqMHt8UV8Qyu3Yv22U7i0rV0=
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr548704265e9.5.1795721612906;
        Thu, 26 Nov 2026 11:33:32 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:32 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v13 20/25] crypto: amlogic: drop unused field and stale includes
Date: Thu, 26 Nov 2026 20:32:36 +0100
Message-ID: <20261126193241.1471372-21-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_193334_857053_C5EEA5B6 
X-CRM114-Status: GOOD (  16.51  )
X-Spam-Score: -0.2 (/)
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

Remove the unused meson_flow.keylen field, drop unused includes in the
cipher and core files, and fix stale kernel-doc field names.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c |  3 ---
 drivers/crypto/amlogic/amlogic-gxl-core.c   |  2 --
 drivers/crypto/amlogic/amlogic-gxl.h        | 10 +++-------
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 72892fdcd55d..c11ccbaf920d 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -9,9 +9,6 @@
  */
 
 #include <linux/crypto.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <crypto/scatterwalk.h>
 #include <linux/scatterlist.h>
 #include <linux/dma-mapping.h>
 #include <crypto/internal/skcipher.h>
diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index e79175368d8c..90c817e412ad 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -19,9 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <crypto/internal/skcipher.h>
 #include <crypto/internal/hash.h>
-#include <linux/dma-mapping.h>
 
 #include "amlogic-gxl.h"
 
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index 3f1ce6c05558..9c3df0d162b9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -69,18 +69,16 @@ struct meson_desc {
 /*
  * struct meson_flow - Information used by each flow
  * @engine:	ptr to the crypto_engine for this flow
- * @keylen:	keylen for this flow operation
  * @complete:	completion for the current task on this flow
  * @irq:	IRQ number for amlogic-crypto
  * @t_phy:	Physical address of task
- * @tl:		pointer to the current ce_task for this flow
+ * @tl:		pointer to the current descriptor for this flow
  * @stat_req:	number of request done by this flow
  */
 struct meson_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int irq;
-	unsigned int keylen;
 	dma_addr_t t_phy;
 	struct meson_desc *tl;
 #ifdef CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG
@@ -90,8 +88,8 @@ struct meson_flow {
 
 /*
  * struct meson_pdata - SoC series dependent data.
- * @reg_descs:	offset to descriptors register
- * @reg_status:	offset to status register
+ * @descs_reg:	offset to descriptors register
+ * @status_reg:	offset to status register
  * @setup_desc_cnt:	number of setup descriptor to configure.
  * @hasher_supported:	indecates whether hasher is supported.
  * @support_192bit_key:	indicates whether platform support AES 192-bit key
@@ -112,7 +110,6 @@ struct meson_pdata {
  * @flow:	flow to use in next request
  * @flow_cnt:	flow count for amlogic-crypto
  * @dbgfs_dir:	Debugfs dentry for statistic directory
- * @dbgfs_stats: Debugfs dentry for statistic counters
  */
 struct meson_dev {
 	void __iomem *base;
@@ -181,7 +178,6 @@ struct meson_hasher_req_ctx {
 
 /*
  * struct meson_hasher_tfm_ctx - context for a hasher TFM
- * @enginectx:		crypto_engine used by this TFM
  * @mc:			pointer to the private data of driver handling this TFM
  */
 struct meson_hasher_tfm_ctx {
-- 
2.47.3


