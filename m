Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D77606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oFZ1IM8d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LV4UTJ6b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y/sEtHC5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=; b=oFZ1IM8dlfmkTA
	eO3LaTX06ZnUFIDUGpnjAL9ngUCCxBJPLJ/oBaRh+YUo+CV1AIL47APdvP3tj7ZxwxttYD7epJDQU
	V77MT1YTojnuFo+FLxbqYTCnQoowA8QB3G4Ohh1L7XIgHmvBsnwDJ3b3MXRasEf65eEemqV0VNzpm
	V+YALLXa+2HKIsrgcraGiOwUJQhhgMScSDe73EIs9k3reeIzBDi3yqca/Tskgp4nuq8Xb44dNnae7
	r9WxjRxqyZQmsEJW/6hbMCrzZRY/Oj5z8ymfLhgoKAQI0LSuuFYikerKJZWYwcwT+MdIQaRA1V1yX
	PlYW0i2VZ99UFlnB3ZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4lS-00000008OxP-35Ag;
	Wed, 25 Nov 2026 04:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4l9-00000008Omo-3p91
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 04:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=; b=LV4UTJ6bEPjSdsoqemOsFTQ095
	pfuWzb5yEZQm5fth7vKbHweZx/pa5txuRkuWK6zSqBfRXM2cdXqjzsi92KQy39qzhfzMIgdzRYK2N
	IyBfgCMhBSS/SgXwdaChcGnkhwopZrkEW60CnaqIJqrrhaxZf4IJtr/xWKU0CgyUz27zx9rAXe2gu
	J7WfifqtTJpYQky4YP8QNtXe1Y25InQed8ckGOkuKWPZAq5NxETKCA6Kx42iKiPk34bu5qmrVqJbG
	vAnGn+B22BflnzrmC/ah2T4XdnSyjz1g4Hch85mEnsAYeDJLuzu/xaCBmDvmuiM0cSL9PYsNYE/we
	gnlC9YJg==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4l6-00000004psN-3tu6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:37:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so2313128a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581446; x=1796186246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=Y/sEtHC56fzYBmlKANn7RnpkL/AuYiBAQH0l7kCidHUmjt331+RoBTsHorfBzPBrrz
         amGaEy7bwAcfAcZa3GOuUw6lh+G3gK3YW+stIzpHuJF+uBYrbutrsaMy6iG8IxqGR/Z8
         9NtS1mO/Nft0+DUi+kvWMy1dShYmINyByYWWHgdU2Bw+oBnlVe0cb9ZmfqbiqstLdQAy
         ED/K7xA/AX2DLGItSDINDEJelENmeMy2C8/UJwHNoaxMuYNIwd2frcDMYTrymx6nynrj
         EF3ZbFODJ9GcLGu0W3v+c0XpoJEEi9KdI6rJa/kNl9vQpXK4x9IYtYOtwd668mPcVhK3
         VXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581446; x=1796186246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=DfFC7k1PuVaMgVKEmnRhHAsD4d2aOJJw401wXzqTpUy5jfLBG01uy4Na3L00cqaYaA
         SvjeQQBAb7Wj5hJWSHXaQ6K2nKWh58z7Gat1WvI6mZ0HQc01ppiaUmBejkrU0atihfjR
         u/4oLpRT4nYuIafWu9+u3lcSKtVKj0gU4UC3xHVqgqGr0yYmo5Qtunoqn4LQSdFLqilN
         V2+6We60ufJRtOK5N5DVKPS70t+NKfwZ6UQReYtfSVa7Rt+tcoJp5q0SAStsCjRy+flG
         j16MpWAubnm+DXIjasAYsly6+vDZS2bWDAfctp1nJgNFo1ie7SMZuus285MGiiV7a4Y9
         1LQg==
X-Forwarded-Encrypted: i=1; AL+hErEr/w94TLmCQrd1CqmFyo83LdL1DB3/xUZVBgZbGk9TAQKgjabk9CYWHkH5oNnvBxQfRg+yP2gGOU2Jh+7MPq0U@lists.infradead.org
X-Gm-Message-State: APuU4Z+sngmBMBxuAN6hdabOVpopRsVNBmPx0YVQ5M0CJd1DClgmVo1/
	hGfvORy4PDuAmdyTxjgD1D7I+W10ERVDmKM5Cy5hdpXrJ7KeJx/x5EOp
X-Gm-Gg: AZFdTZfQeEuxacwyJCY4A+x26dYpY3G2FpHn3SzswyTIf7KeCkjuCdm2MKpi3dC/WUU
	JKlGZlQRLjFHG5qdToWT8TD/QA3YUMMnAvCvagVbcGYlp2gDipsC2obMvWIAJ/zYfcp45A8PUCG
	oX2QtwzJMFlqC7xgstk40ozqgws3kP7iq4SamZErIQsWP8QBw/bqhqwG5fdCeiKktHuQ2bC3oD+
	Jx7rwKl838y+ZYF774Lf+mSVhYSr4bb1kY7wMVsxxAcQtoJvCLVuCIVehzhnFSnp2gNzFV9tmqm
	mMA5hqn8tIK8jIlnKoVRcsNJA/gl/SbbA+8AKmBcM6/DVaz5ahkxC/o6ruC56JeXd6t/bUFbB0c
	4Ns6NIVAlk9SATOyvQ27iEncm3AXFuyvfHFfPJZHcdov7OB5hvHP5iHLT3VGAGOuw+iCNV6E0ik
	/wUPaOYXmuZBb8f1DNqR/MQBEKYKGWHMbu83CCaXzH8GlN7G1n/Y94dC1qti5LzbgC1C92xDEGy
	WOeMsPApb63GdqMMKHNciP5CPRIK0DH2vC2XEs769Z9GyrSPjXyBloG3eBpbSa9VuTHsGSNJOuc
	eRydnngKiQVKHoZTE1kFS690/YA=
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr13865555a91.7.1795581446160;
        Tue, 24 Nov 2026 20:37:26 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm30506154a91.8.2026.11.24.20.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 3/8] phy: core: Make phy_put() ignore NULL and error pointers
Date: Wed, 25 Nov 2026 12:36:34 +0800
Message-ID: <20261125043639.249525-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_043729_023681_253E8C05 
X-CRM114-Status: GOOD (  11.96  )
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

Add NULL and error pointer check to the phy_put(), so it can ignore
any bad and empty pointer, this will simplify the release handler
of the bulk data API.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index efbd7e139dce..5004d28b167a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -780,6 +780,9 @@ EXPORT_SYMBOL_GPL(of_phy_put);
  */
 void phy_put(struct device *dev, struct phy *phy)
 {
+	if (IS_ERR_OR_NULL(phy))
+		return;
+
 	device_link_remove(dev, &phy->dev);
 	of_phy_put(phy);
 }
-- 
2.56.1


