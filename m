Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF67606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+E0RAt7;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=X7TNJr/b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=; b=Q+E0RAt7Ug9C/rQ8Zp69ypxtde
	WjjJEveMjG0c0W5bcjk3G2SBiGp3jHuFU3ZTX4Myx9wteDLwDkeMfddBHYVcUqhhLajeDK5E4xV8L
	hIPOVS1LzIcZ93TzWM/pYZG9J2g/FL6eVHZVEjPvd5BreVWZUGdAfpWYetMK78VCWqkJwDZ1wfyFB
	q+NgJ7vSFu091m3f3Eulyctrdv341yKjfmOc3WHphjjmyYxhCEcwzTwxlxrtHX2vc2jVgrE7AK4IS
	h0adfvxm8fJQfo6eCCrWZkwHvj0JFBSz896Xv4eDpQ3yvk6SOD5BGN7mp8XBTJYVMSDSJry/kE17A
	/sQUpaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUzZ-00000003jiD-2FDA;
	Mon, 23 Nov 2026 14:26:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUzV-00000003jdd-2MQz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:26:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c51373ae637so507340466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443955; x=1796048755; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
        b=X7TNJr/bqRJFrnEVfCkE5Z55ZU3H4CvIcfIfsmJ2mBUGaQA3YZ2g5Yx5HMSaryYCTC
         drC7xpc6BEZKhmARDWCixSJ53aM8DdPI4A4uaP78EzmfdwGJve3GYuTnC+TYzILYI3Uo
         Fc2LRrAdPQ58RqqE+hJzrQd67tqua3qyqy8y0ysWso+RTulJJmEdE1Oig9en9QIVfhji
         88Dj9Wu56kzmmDDe0CO01qRPsJLjgOQf11GEwTML+1ywooRpctH19xOBkCUp6aPAgV3t
         Pnkve/rK9nn+jwLBQP4qUHzBfbAWUu27FDr80H0ViUhxcK0e0gTj56FqyfQZTc6SN6Qk
         B/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443955; x=1796048755;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cj3zguVu7lWCJCgLfs0Mb2vwVUbkkSnlbqSfbG7RdEA=;
        b=zbTxiHlVJEfhv61/QApyGdwue3K4g8c1cOSe60eurrsYCtpskbDahaAtWmB10kZJFH
         LWM7YmMvPPvpkI5b4iliONMenQ5BqBYEx2PSVGvUqIz0kWBehqJ4JDq4uABdMcw/U1tm
         XyeO9qhPAZyq5OAhhteKLVZ/xuBGpTyEQyHanXH64ir7qE2PUD6fpnGBIV+ddhYMUgfK
         +jZ9RDW1FOI3gshTzMryMg+woDySUl6zPrfG87Bm6utJ6LAOZ4x3CKT7Ay+4cBf2yIwz
         0ocpE0NIF7aSwr7AFh4oEAv2VmO6u5HsV5rLpsZ0QfC+vZtq/XGz/Y3mNJdW1KH9QkU4
         aNaw==
X-Forwarded-Encrypted: i=1; AL+hErHp4a/hIZGlFIlWUVXsVgZr4Go/QhkH04IM4qUzxtiRg5cdaeIHp70OZinWOT0an1EJdBidCjG1Gf061bE8nqrY@lists.infradead.org
X-Gm-Message-State: APuU4Z8WfUmKiOjTVVbjYpQ7DprgYmJPzuW/uom9EpCIuptzXN3q+IHP
	/wM5YmOISxBLJ1dz2ygQoIbP560eKII/g03LWSvqKi7dBPqVLlvGMoS5d8U4GB7mOU8=
X-Gm-Gg: AZFdTZeRXeZw+/OrH0i29f3Nw8AZ6t954sbrl39vXtE557AqM0ojS1NhyhhSZHFC0mC
	2pJdY/Pdai+gayMT6DLYWZKJtWToXF+KdauIw1wvX0I+RM+b6/j+d0eTDyTp9Z1J2iuFTtTeNzh
	V45TJa56wb9BlvxnJ+G/+plJkYg//zW8taObUYHnAqBEbBKHqdDaDIF0l4f9uO09/auDIRW+FwT
	refLZy4yIyDPVXK5+oB85qYtTV7LhS1wbya4RUiYiM0OpsndlAnu4IUgEyhJ9ymLTXhuxcZPxpn
	qIOXX/uuqjOsmzlPC22pG+/OFq9fZc0gv4E7Dgt1g9mVG66i1VzDFOnR/FxRkLDFIrH2LYy3yPq
	MSzagENTkLPJPrE2Zhl8jI+cGakg8MarE9AzYjwkVFc9d50Mh2VmR6ReF78KaDxaRkqe+Rq7jOS
	CZCPMITrsrDGjT538eqeYPMtJ2qEx7FrmxnLRA5fdhRRmRzoZL/qLdKSk5pSVhGkrZYEdMF7Fzd
	u9FSfQKY05w1HPsU5A+tHTOlh+YISWKu/oi3ulMmPDvSWhEDGSVrcUDE+39B+MkX+YzpDcNu04W
	KzpjmGNXzxO3Nl2A/OS5HsvydzasyVtbh3nVrnJcOXQtB8tZlWlJkapi9cNKkzhhavzaq3J4Gs3
	3QfK5xTPKkA75HHMIig==
X-Received: by 2002:a17:906:1c11:b0:c50:8d2b:4392 with SMTP id a640c23a62f3a-c513ab38967mr715904966b.49.1795443955446;
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm428224366b.14.2026.11.23.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:25:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] phy: exynos5-usbdrd: gs101 PIPE3 init fixes
Date: Mon, 23 Nov 2026 14:25:53 +0000
Message-Id: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPFMBGsC/42NQQrCMBBFr1Jm7UgmBqmuvEfpoolJOiBJSWqxl
 N7dsSdw8+F9eP9vUH1hX+HebFD8wpVzEtCnBtw4pOiRn8Kglb4S0Q1jJUX4rhanccUscpqHWSw
 0xrk2kAlKKxB/Kj7w59jueuGR65zLelwt9Gv/WV0ICW24OGMldesfL05DyedcIvT7vn8BPNREj
 sMAAAA=
X-Change-ID: 20261119-gs101-usb-phy-orientation-44cc8f14f020
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 RD Babiera <rdbabiera@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, phone-devel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_062557_645700_91629F2C 
X-CRM114-Status: GOOD (  11.07  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series contains two fixes for the USB 3.1 PIPE3 PHY initialization
on Google Tensor gs101:

1. Re-initialize the PIPE3 PHY from the Type-C orientation switch
   callback when the orientation changes while the PHY is already
   initialized. When a cable is connected during boot, the PHY can be
   initialized before the TCPC reports the orientation, and DWC3 runtime
   PM is forbidden by default. Without re-initializing, the SuperSpeed
   lanes stay programmed for the wrong orientation and the link comes up
   in high-speed only.

2. Apply the existing gs101_tunes_pipe3_postlock[] table once the PLL
   and CDR have locked. It disables the high-speed RX squelch detector
   in P3 / U3 to save power while the link is suspended. The table was
   added in commit 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos
   USBDRD 3.1 combo phy (HS & SS)") but never applied.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- Add patch 2 to apply the existing gs101 postlock tuning table
  (PTS_PIPE3_POSTLOCK).
- Patch 1 is unchanged from v1.
- Link to v1: https://lore.kernel.org/r/20261119-gs101-usb-phy-orientation-v1-1-bf3c4bbf328e@linaro.org

---
André Draszik (2):
      phy: exynos5-usbdrd: gs101: re-init PIPE3 on orientation change
      phy: exynos5-usbdrd: apply gs101 postlock tuning

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 63 ++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261119-gs101-usb-phy-orientation-44cc8f14f020

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


