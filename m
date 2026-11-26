Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FFF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i3I63ikd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtDdc7AX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zTCr1w1nVA+vCLa1qAE8nCmQD5JZKwmRbzFiPOSprYU=; b=i3I63ikd2lDLl8UO7ztoozftVR
	iGbFM+/jjaa4R4FQ99QZJtHc1km57u4gn3AIYxCWUKfsYNhLbxEWlwpXkqU+h5GRAzsfNuW0LiWzx
	JTMwwe60srk/tLFSzRVd6NmpwyqQKLLRESdW3Gw9IqZsSP8q+PKnMpQUBVgdIJiM9VUChvgcMxANC
	GoewbRlbLs6XR3Qycs8RecbsGtrX21FzslltDlOO+kh9cv58z2SJZJgc+9b02hvTpnv1Pn8+uXO4d
	UhvhgPtO42DE34nCkI/6mhiAHUrroyhjMnFbnf+HOg+WHrdTVgB8mQmYucAimGEuw99ZbVzMWqw7m
	g9Bvce0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbqT-0000000Doto-2AXi;
	Thu, 26 Nov 2026 15:57:13 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbqQ-0000000DotO-1qqS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:57:11 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-33fb4680717so2860189eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708629; x=1796313429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTCr1w1nVA+vCLa1qAE8nCmQD5JZKwmRbzFiPOSprYU=;
        b=PtDdc7AX8s0TuSZsGGfxD47cQfQR5cgLIK6Llyg8QIznLJeTEuwIBV9BLoPWsF/wp7
         JVuBlALF7MMfFSSqkYmySzJuS/Y0FTz8iy03lB5ct6L52yo9Vz1DeefiZcmjXX6t9Mc6
         LlsagTpLCZfwP9cIuSM56WTXLJxi+X4gCnkUoP4P7g+K0pfK9+pkIZKgWMWV3U1hqHgR
         I2DzISQNVkpUCLrulU/8YaKsarstxmh8qdh785YyUI68LcJi8n6l1BDdPq2uKOy+LiNj
         AjPOGGO9wWMqgH8kmE4pYjWvTCJLKL+du2Wbd9mb//P0j9TZw/m/+OFRpXaj+GPBH7GQ
         mhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708629; x=1796313429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTCr1w1nVA+vCLa1qAE8nCmQD5JZKwmRbzFiPOSprYU=;
        b=aNW12IgoW0TufDN0jnWmuyi8SnW/kUjlW2n58sMzvwxnvYAY1WJxqwtJtH1YTxYhSg
         jHAAC41fM7BVc41ubwz0v38j9DomCKuzZohQPFX8HOQeYGizMwnhPypAQxL2olfresOC
         gjOLm42PIqk2AupfYs1MkrmzJG4EIvhq1Utz1KSHijRrudDURP+yoI65VZIpnbTu5ymt
         rQXgOHs+7AuturZl8zR2KVWgMHV80/iHv1QpElfUNDIbETeHJATGaOfLPH34VNhnORum
         fWaq3d5qzehpAtnI4qr/NNIosMmQIH/lsqesU1u1pYwGzKkfnh1kD8YQ9cEMnNDtxylp
         LS3A==
X-Forwarded-Encrypted: i=1; AL+hErGs0d2i8fU1NdZX5AMSif71SHDouv7KIuGmCjmlS7jSmf/aEHPfCQyaV2HMbjD+CbO/d4mtBt4Jc1qY67W1m+pb@lists.infradead.org
X-Gm-Message-State: APuU4Z/mfb2QzkFZ/JRnuxeYD78yEVQntcTlZ0tdShhz3KEYvdmWD0HO
	3vIikMgZkTgIUAL5KAk3Fz+0JMUzqoDUi7b+mNCV1kUFb3/JHv6g1m8=
X-Gm-Gg: AZFdTZfYAlgPvZnezrRHQqwdOmfHMSrthUMePVhLZocp+N8pKzmCErrx06uhkYzp5EV
	eAjZK5YC+lZZuhAw798cTTxnybnwBn64FuJbN7fmX4bYUCyYlmO542mv2naGlk6Ry21joRETT43
	AsXdiy7bs6nu+dRVvVWFxkJ0nThbFg2vDn3Z7dqHq+3DD/X7AkcdyODOCZssbnhD2tV0lUZysD7
	oxZZKpPxT2SonnqwIQybvHLErGC80KBCPbB8V+//LMishEh30wkNiBvtQNq/PoSNNHOqjwQiB+G
	Z7RrlyEIPuxSZlH1SYGjijdE1zKLovUHexNIXLQewGcUTK7O87PXLkhSWQb7iyEHOAVqkJoEBq5
	85o89XZj6etcLeTSN7J4Ee2hgTCaJ/kEe/UDS0epW75DLUuutqnv2M9b+Xdn756lhJnPuYAF9q5
	tASsraz6EPRW8X23Azoccrfjh83s/7iNk2nYzhxdZrf9MpEwe6sDuaMVYH1v9udLON8isT5wTsQ
	UGzKugx5f7ZIvE/9vE+UsFkLu2sOJNfyglo+gGEuqtVMaRK+gc9XrA35D+UqbEM4eR2lWmuLI7p
	bnenu7pj/zyCkveXhY67itiZu7HlgCDYKiMM2mPylAUkDCL0qOVb+94Ln8jxlUYX2Dg=
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr12731586eec.16.1795708629339;
        Thu, 26 Nov 2026 07:57:09 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm58003234eec.20.2026.11.26.07.57.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:57:09 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] coresight: tpdm: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 23:57:02 +0800
Message-ID: <20261126-coresight-v2-58e559131f2f@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_075710_631290_5799DF0C 
X-CRM114-Status: GOOD (  13.26  )
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

coresight_get_platform_data() takes a reference to the destination
firmware node of each output connection. The core drops those references
on registration failure or when the device is unregistered. Device
resource cleanup alone does not release them.

tpdm_probe() can return before registration if driver data allocation,
MMIO mapping, dataset setup or device name allocation fails. Move the
platform data lookup after these steps so every successful lookup
reaches coresight_register().

Static analysis flagged the TPDM error paths. Codex helped prepare the
change and describe how the references are released.

Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
v2: Rebase the TPDM fix on the CoreSight next tree. Add separate
    fixes for TNOC and TPDA following review of v1.

v1: https://lore.kernel.org/all/rc-b1-20261110-vc-178-2d9055f946c8@gmail.com/
Review: https://lore.kernel.org/all/e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org/

Compile-tested: arm64, GCC 14.2.0, W=1, coresight-tpdm.o.
The baseline and patched objects built without warnings.
No hardware or runtime tests were performed.

 drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 8464edbba2d45efa5ba041dae70149a946c20465..f4b879bfca1a153f50012757e1b078605fa87944 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1408,11 +1408,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	struct coresight_desc desc = { 0 };
 	int ret;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	dev->platform_data = pdata;
-
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
@@ -1448,6 +1443,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.name = coresight_alloc_device_name("tpdm", dev);
 	if (!desc.name)
 		return -ENOMEM;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	dev->platform_data = pdata;
+
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
 	desc.ops = &tpdm_cs_ops;

base-commit: b7d7462c7f973b65de511db6bebb99fb29946ed8

