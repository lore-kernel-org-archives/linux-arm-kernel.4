Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C6C606A931
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZeErKa6A;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=OkOKZ+IJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Unsubscribe-Post:List-Owner;
	bh=7a5KXBMGWiXvI5h5MdzscclJ8kMFpFBavCEcOmC6V0A=; b=ZeErKa6AoZqwKlbrfhzT9d2woP
	JcZNDbcWivNdOycp0MTQSX5To1ZiXiIQT0uuFIZprAA7VMQpsgOZvdC8Wlp6i6T0IztNUZAy7tCmr
	Ye5+baieopj6p1y+OXpQlBRmPV3DXW057hz4utMFL21O86LbIGtWCZcl4xo92fWxBQbXXk9k/zFFN
	1TzlaXdrK5rsFVmcgvDFC0otx+/6Efm4vPe+CXLmg0kWblo66IyTZxO2hZUl7GyVtK7kN3uI304q4
	PNPZo0LIE8KgrvqclbtPNCCRM5tAhRpN6izIyJFOTIUGKS3Lq0uyhvJAwF7Ymq+ruX5yLE0vM1fxj
	4r1czgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8tr-0000000DOGU-0uzb;
	Thu, 19 Nov 2026 20:38:31 +0000
Received: from sonic-euwe1-0017.asd.mail.yahoo.com ([34.2.82.16] helo=sonic.asd.mail.yahoo.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8tn-0000000DOEa-0iHL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1795120705; bh=7a5KXBMGWiXvI5h5MdzscclJ8kMFpFBavCEcOmC6V0A=; h=From:To:Cc:Subject:Date:Content-Type:References:From:Subject:Reply-To:Content-Type; b=OkOKZ+IJdgzzFgottAwZazfgP+cnZcOOZ7Ou1uiGiDH683jwSlFgCddSDUt7cCXeyJUulnl+lIhCaB/BgDpyB/4IFBMCdFWy4qHYoWkHgNTOx2biejQILph742uDNc73WhHT+Iz2metnIW7E2V66fur+Ddr1W06dD6KKwTcrUkbt0Fjlqt2OyBbA97lctuIsK8vNS304vX2aR+SQwRd6YYYELpJqZe/2HVgwi2QdQg6VfseTqxKtogf2lUvZuoN5b9rkk+5b4JT7Lm6OTQWQetB1pkGPlhi6/ZkTw6OGbEoBbnJ3kSZ/vLXAzUkWd1b/q85e5sotgTfLFzzk7MUYlA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795120705; bh=o4qZVizyGGrgzfXgUFZfzs048sFhh93+J+2tql5WkpS=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=lLJADHEf4+b8aBmFa97ymqyUQ81Qnik0mm+g+rzXK7mpn+HdMUNC4B1gdzExoX1g/9xEMOeMbgXar6uP4qQSX32XeefEhSdsHprg6C3S+tSPErWOJutS1OTmaQLsU0l1PoF6zHLXXID+YqOHvBjpb+BAPcjvyVlGRunM+Stlf9tDw95uxoBKrLVts5E39Y6L4Zo0e4LOqv64/mS9lzALepst55loIxy2gdRCad/U/tWJZq3Vml1R+ENVywLO03PodHM1CSmie3kxhhVBlgL54wQiTdv3iJ5zdveuYgVtyiaq99yuHv7ji0qiuaWrW3jrCo8fwBvntwBoDgODmJJLgw==
X-YMail-OSG: FXioNcUVM1nhCns2TFMtRc2PlWEsl9tHr1LPfTj0VdXmb2EUFN1FFEIhjndKpC0
 pfdjYFejpACyHcLBbs609N3jBTZj3X9HunCVCo6lm_TqoecdhjlT08FQot2YV6YG08g.pUlLs6fJ
 OzHOtH6GLJLlml1fH6K4SQZiYZl8znZPbgZOwzawXeBPMwnbV4NHADjHTZO4wrKrz_grqVQA7XBu
 EJtM8W56SXhFJD5hFYP1tfcDkO9JK0FROHXyJd6oPb_JGNp7B9xFiZ58p5Ag4jnMT3SJYBGRZ6bJ
 1sn4sOz2R9uygwvYVzh8jGqe8X0A9s5Y7RaSM7EKUJdWheZ2wYjnhqxjMuPyH_vTi.dqkosBafnT
 wVINYlIx9wcjgDunOYEACs18zVYOSuOyK8Nl8D7NrI7Vkaaf4QaX2lVB7KHZAItC6r_iWKdp4b7X
 poqWHg8i0vabympImo5TQGBChTgcequsfPwelbBgSJBc4Xt60v5qaPKDrFh42CmMnj7Ow0Jvfw4b
 dLodFIMtvY9Wth3MNB.Ks08epauEOqnuaKZ0G4DbfPXj4f3LrxbbSFehoDoQukVfxYJA5y5JglDn
 ZK5W95vJDVihJISmCps8KUOjGigdZKKDcery0xd_UrnLr9y7KmgtlFehhOt9a.4mm1xt5Ev98Tyx
 Qw1SwHB5O.OTeSv_j7E0mjx25IglL7IFLJZ.ed25yWNj6AtqOlaLGiGyJ72ZBAtFZgpdlUEys73V
 fk_ORHe6s0fdbD_9TrqqZPIpVZp8E8BqbVgZwOBX5I3u3dHhA0kDIFZojs9LzC47tMSXiL9IO6eT
 UnOPkPyLbj54X2r8gYB6ryzVmQpYsPafnRlkB.Ze9JtmPmUTLyhNpl8RPyev3.KrGqcQ6_XnASDi
 df3IAWTnV2b_c8D44ujReAeGbcgeSaNTxL07rEN3ga7K0YXfwMjAkfBeGSZE3enqZ5SfyYdwGBHp
 NglIMveE1bnf.b2NFTlC7ozgVoJVvX3l_4F98MVKvLC94Yu9xsGERrZmFbnbv5fk7K1FrdtuDq0f
 N.2RgENYYpEgDBuCpPK49WppT1Kbur0OkV.tZLjS41tLd9bRYPKkN1W712jTxRFJkfjhHFC.nhsS
 QZAjftlKnGnlijMSvkIzfHRY_bEqVotyQWb77NYoaYXXgvBL_C29Lp8FkPMfjMKw1uQc.bVQvrFN
 u.Z0rtqQ5okHbdB3v_rsNDbDA9mddNM71yS3gVE2Daf.rSzRYF..TQ3.jOVUiwumo3lmBZNCAQ6c
 g0O7V0i9lkKBUfJgbnmUHfSeEb8jLZbHJzIf.qAWqHkijJm2wPK_apc48MqKQvN6vi5wvylPTo9P
 kVOUs0Pu.Gd.iqEc4dDMbkRI99Y5AYD9CoYRfJ0LaFnMyeK2y1D.FlofBF8pnizai7UtrJisBkYF
 77QNxVt5bSdMG9RvG_ZAw6nF_1meRSmeZ5BL.SWTlRj_pSPExg2kOfxD9pmFpyn5D2g8Mob8mF8W
 wqFQqmNkz6mAE9YQyyeVuqtbg0CQuGpPWslmknbtSPJSbxLTKY7E6Nf1v_OKGSnpBaZ4uMWyxIgg
 BLDdm_ft1tt84wgvft5oKx1Bg7HrJHhA5YQ7PKb7Fjkb0HNII5caRtKtj0MCxuwZLIjn6WHOHgXZ
 qfPUO705sA075RjeaUxYdMapJTLskeF.pDZZr8DQ9WaiH8sqUPQV8alMJ6y3Ib3DTGlBoYIiofhV
 VvIPfqymUeIlC8Ik_G.pgB2tnf3Zq7EZRQe39Vz4GgudbajntU9obUxAkP.bWv9FxmVhbsgFcDmA
 KZqJ3dgyFP43qDrOkIR26qJCTOM41Wl8xnBnFhjI3kVGjYvEch.xm2VTH.Ml.2AMTcC98vnyjzow
 hYpKbmhLpSoaZTLZBM3LeVBTvq.6WoUH7dY18LEA7hyd3CSy5kOZF89dGJS.KPnLintLOe8YAJrc
 uxcmm3Oc3x10mXyVBdrxqMYL2DWgz3r7lsogQDFYbR2faGiIRiXbu.EI4GIi_vzTgMyjsmC6R.uz
 0.7x8chGVSfFD37l8IIO1FI.zBaRPrRD3JpM-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 07da5095-3fc7-45bd-b873-9cdcf08538c9
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-106 with HTTP; Thu, 19 Nov 2026 20:38:25 +0000
Received: from dip71.lsn.ir2.yahoo.com ([87.248.99.80])
          by hello (SMTP) with SMTP ID addd1d6f2e071d3be06230aa2a74c031;
          Thu, 19 Nov 2026 20:38:22 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
To: Vinod Koul <vkoul@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	Frank Li <Frank.Li@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	dmaengine@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] dmaengine: bcm2835-dma: Fix OF DMA controller lifetime
Date: Thu, 19 Nov 2026 21:38:19 +0100
Message-ID: <20261119-bcm2835-dma-of-dma-free-v2-0-ebde4846d206@yahoo.pl>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261115-bcm2835-dma-of-dma-free-ef85776c0914
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795120634; l=1733; i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id; bh=TBSamSeez8zQQ9fCugauBqXaGRUEYL1qWXPb93Tu3sE=; b=gbbk1HzLPzHWC9sHX05ahBgSbM3yozVxZHuMRSczgyXyM/hm9IX9Zi9wq7Wg8GZmVSgMKFebr tLBgaKdAyvKDXpdoXu+wHyWGIyKCVi/c11IzqdG1TC2FFQyg2p5ATrY
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519; pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
Content-Transfer-Encoding: 8bit
References: <20261119-bcm2835-dma-of-dma-free-v2-0-ebde4846d206.ref@yahoo.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_123827_420982_5968DBE3 
X-CRM114-Status: GOOD (  10.25  )
X-Spam-Score: -2.1 (--)
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

Patch 1 is the minimal fix from v1: free the OF DMA controller in
remove and on the probe error path. It is unchanged and meant for
stable.

Patch 2 converts the driver to devres as suggested by Frank Li in the
v1 review. The OF controller is now registered last, after the DMA
device, and freed first, which also closes the window in probe where
a channel could be requested from a device that was not registered
yet. It uses devm_of_dma_controller_register(), so it is not meant
for stable.

Verified on a Raspberry Pi 4 Model B: unbinding vc4 and the DMA
controller and binding vc4 again oopses without the series. With
patch 1 alone and with the whole series, binding vc4 is deferred while
the controller is unbound, and HDMI audio gets its DMA channels back
once it is bound again. The remove path and a forced probe failure
were also run under KASAN in QEMU raspi4b, again with patch 1 alone
and with the whole series: slab-use-after-free in find_candidate()
without the series, no report with it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Add patch 2: devres conversion (Frank Li)
- Patch 1 unchanged
- Link to v1: https://patch.msgid.link/20261115-bcm2835-dma-of-dma-free-v1-1-d539234bfec5@yahoo.pl

---
Tomasz Unger (2):
      dmaengine: bcm2835-dma: Add missing of_dma_controller_free()
      dmaengine: bcm2835-dma: Convert to managed resources

 drivers/dma/bcm2835-dma.c | 53 ++++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 26 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261115-bcm2835-dma-of-dma-free-ef85776c0914

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>


