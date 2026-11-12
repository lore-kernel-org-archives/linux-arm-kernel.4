Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB11606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RDomi4sJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iznwZRrm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=; b=RDomi4sJHkrH4v72fgEKU7SvcV
	sTv7jGUw1zyDRBK4aI7QJP6Edc35bUCVLXxUgyrnmxqqxpYBlYC684BAsjVM+GkZHYkJGPBvFmcTg
	+BKMNyEvZkeo5sRymF88V4dZWR0dWnCW1x4fhmql7Geu18OSc+iVeyhcxru0PJNKUv/1j5Goxz6LL
	fn0ius5I/OYDb88DMl83ntUmuEhbscyy6XjtrgT06V096jBvMA9kjdL6jKI1VD3ym0ziu8pK5yQ0S
	5065mlK+sdU4lDRA1S90W9Yy3MZ+HQAFavpJ0SwJUjXZ0C9o/Lcim5WOPmOVVzK8O7OedMCwCFbAs
	Tf2uQ7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROjV-00000008rbW-2vIN;
	Thu, 12 Nov 2026 06:56:29 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROjS-00000008rbC-3sha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:56:28 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-53639b8903bso7469041cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466585; x=1795071385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=iznwZRrm45XLIET0wEVYeQahjgm75LG86folFDn1k5Hoyq99xn2foPk9yc/gsQ4/7L
         67zMPbWBoYP8lRoaUXYxAjiSTe0yuLvEyjTsTGK/H0yjhnz575OEuWRVza7CygbqhVMw
         n/MUv3m0IMrEUYutpb7i1ASqyuyJi1e8hflsV8r3Y4PFcxPXCMfDiUrB/O8kQbkYJ6HK
         mz0unFruyY4oVlAkdc3ZRJA02a9iXEG+6w/CLJH8ijil18ezHtumRJhDWRAGduxPB5YK
         4GtZN4592G7Y9bVaeBvA1e3si6s8Ezt+DAvNnCqPK2pN5jbfg9fGjezxxpFNXv0ytfP0
         1HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466585; x=1795071385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csZSNdtphR4UrJionrHwtrF+cPcKbhAt8xmIfm2H+zw=;
        b=LMZyN+awlXBdXPDYmQ61VzYycsqurU+xuHUGJAwdsXbwws/Yl8PiF5cer7ZXcT3ELS
         jo5kHdjGVUDwKOtHUzWbSwnPzUx9939PJSf/cUpN59m/M3VBMGy7XUi0EyMFiOFNhOlv
         2sC0/3E2mEsp4D3UGzhTAxUkYUeVHkpE7JXM0qdDvPrzdHVX+dillPSmLEaAHR3S1yH4
         JxNMGibd/eWAA+l/Jw5leRAOiAA672HFHTtlQunilvVDOVq0ZGACsudzkJbExXG4bU7a
         eOL8nFl02U3WVHKHtknTBvZ4etw9CjrrU/Br7ENQ0HxbqAjAOdvzYBgXEW0BfXiznRV3
         r8iw==
X-Forwarded-Encrypted: i=1; AL+hErGm7ju+9f65DzdZ0gwvrlD7bvMc3qnGkWZe9bi1f1xzQn5TJ4j1NNpr8KcUJReH4VygmmneurfHxMVq/j2GF/2t@lists.infradead.org
X-Gm-Message-State: APuU4Z/I694K9ew2Sm4DnXJdpbETlVwIK/43ShUiEXRuamZyRtvlCEnI
	kNBMmrXi23EE4cvGqCqrzP+BfZsvwTqFqeUrOBjX8cHYQcvDqIoMIbk=
X-Gm-Gg: AYBFou3RMyLRHdkn/ODDdD6ng5sy7dnSeIGDh748CAgmTIZYXWl3rzRQ/LtwN3eOZd6
	mHyObaQzy/pMguAVEIsTooviwXDhM2WAbEKAwA5dHM6iGIdd1dhmWzA1wDOj/YjtyDvbKdnPpOM
	pUCmVEdX9CNmUa3CIxFETJ+JvoG+IjLrHhyLd0qvurVGp1rTMQclnQMMvoKELFhbeUeZ1dm47fd
	lK2cKrBhIVh5cowuskHbkzvluuBbWnxBDjwVG/vc4S/TrDL/GGCHKdM9GR1TP2lvvPAfMmrCT1I
	MIA+dVyxlhTCTLeph27UY6gVHZSbq2E4PiJfZhadUJInn2wvbtfR5RyBRhlhGF5TtVligyByo8e
	oDO6tB1NlQFgr7b0TnJ1TRSXCyKtXy/zuSwM1q+86xaB+Vr/pnC/O/9z0eUUkFJYwgp0pfEKGh7
	zMoAzJe3fgnnlwRf+NLMWc+vwyoZVxzv2+bNA+8zJRtiPs/92LTD/CjRGitOzYZoArqxpZZCxd+
	+muNmD6fL+Yi7QKcvQQVZ18oBHpGTkdlUyl9kYFS9C2l1xF7OXras5rnuM4aesnSdRxt06sGCZi
	7tvWO8MtIcwSruPHHbCjrIz9/MMKng/6MYw1Jrx6BtvbLaXobZNkzDVArLIO3hmzKHzLQSIGmuE
	NGcG18eE8s2SLfGNoBmWjhOM+B+x/qyXtv7IbAePErjfqdXCnLd1BLSTutxE8K41hcqMtV6WtVv
	ot1tIal9va7qc6EjAIDtOTfFRw/yBacorSHkseI0PVSCrjme5zaGLkxA==
X-Received: by 2002:a05:622a:1dc7:b0:54f:7f40:799d with SMTP id d75a77b69052e-55956e5ebd8mr31073631cf.31.1794466585518;
        Wed, 11 Nov 2026 22:56:25 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef054f382sm64827376d6.43.2026.11.11.22.56.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:24 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: sunxi-cir: Disable the interrupt before stopping the hardware
Date: Thu, 12 Nov 2026 01:56:23 -0500
Message-ID: <20261112065623.34296-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_225626_973856_4A7C3BCF 
X-CRM114-Status: GOOD (  11.78  )
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

The devm-managed IRQ remains registered after sunxi_ir_hw_exit() stops
the hardware and rc_free_device() frees the rc device. A running handler
can therefore access the FIFO with clocks gated or pass a freed rc
device to the raw event code.

Call disable_irq() after rc_unregister_device() and before
sunxi_ir_hw_exit() to wait for the handler before stopping the hardware
and freeing the rc device.

For backports to kernels where rc_unregister_device() frees the rc
device, disable the IRQ before unregistering it.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: b4e3e59fb59c ("[media] rc: add sunxi-ir driver")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260729153104.3F6641F00AC4@smtp.kernel.org/
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/media/rc/sunxi-cir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index e97bd9e03c1f..9d22ad7aa94b 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,6 +374,7 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
+	disable_irq(ir->irq);
 	sunxi_ir_hw_exit(&pdev->dev);
 	rc_free_device(ir->rc);
 }

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0


