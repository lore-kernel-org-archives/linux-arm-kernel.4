Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A809606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sNOUreHe;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=J1FeZzLv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CyhLtxPqucnTvglU6vPUcgicYIIcymP0xm3YGvJCP9Y=; b=sNOUreHev3+l/G
	+wzKZ/Ql/7YrDvg2XqFMVWSSw73tdL06VYsgbZc8hSmmTphd0vV9BZvGSG3ytgj04nu3g+YEG++pT
	gPYjJ52VSP5djcT7zHqAgFzhyG6UOLzs+HQfoUG7C9E3khxaZogGZ0XGyp2PayeSoVaJg3ELnIzDC
	Nys/xDUXpRP6aMEIZLdyYUK3sCzyr7eCH1jOSISaCt/b3Ju3uGA6PgOqhQ/og7oyF5CM2gGSQtdOB
	MjtMhKptG964I5R2GNe2BQEqvXeCRoNPHu7zl1R7Qo9I7fjKWGkFdx3aFvze8g+WldMr+z+lLSX/4
	53PeZuLtzHK5QnJEIYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUUs-00000009xJz-1boe;
	Thu, 12 Nov 2026 13:05:46 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUUn-00000009xGQ-0ZqA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:05:43 +0000
DKIM2-Signature: i=1; m=1; t=1794488739;
 mf=PHdhaHJlbnN0QGdteC5uZXQ+;
 rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:OLKJ3Wu7Py5uc/JAkYuWEfv0g+WJ
   aVV1Hascx8Q1fnKmnU+wPZ4SPlRl5zw5dCrluEI8JaM5eAcR9OQEFsVEg8uscfKUOp7dH0qu2L2
   AN8+ALSKYjD/SRWI0PeIvIF7DgnKj/Gnn83uIxU5Dv3bp8QzRz17WyKvRkT15Tp+ls1rJ6Kogk7
   mOA8uDCWEqMRFPaA6Hywj6B/aCXyWFgfqFQCHKz9DbzleGP3wD+b9RgbAbvnbz8I4YeMCrHEaWZ
   rRUJyTrrdDB+3RVF44ZdtMbWHOlDlBJ0rf1go1/mjK4t0b/nNUsGwClWN38/G+AqwyzOeFX7yxM
   BXFCB5PatNFUKQ==;
Message-Instance: m=1;
 h=sha256:
   H44EDw6xHn8ou0aTBL3AWQP0sovWq1OPZnBTiuXbmJA=:
   CyhLtxPqucnTvglU6vPUcgicYIIcymP0xm3YGvJCP9Y=,
  sha512:
   bzWMRQotmt8HALTbH6wkdQ5K1pAA8o9dQcSaVGSIiqJcVj+CN8rH/HFe8/fg7c8YRP+tofjQCNEVARZYeeNfUg==:
   40HjT2vf6TKz8kWe9Pkh1Jp7FXKswGfhPA075iQ0zKYgChaDq/PHAo0zLi3Tw2xFTvhM3kfF8qqYiPUOZDj0pA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794488739; x=1795093539; i=wahrenst@gmx.net;
	bh=CyhLtxPqucnTvglU6vPUcgicYIIcymP0xm3YGvJCP9Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=J1FeZzLvhjwY/5RNtFqwcy/FT9brUeu8VHJ9AVgQ9VlEv8rvA7G8oSJWxhfGKoxX
	 v3IDzzOP62fnkbM3GbRSnA2vLxCXJGzrgeY1RKZq8ac5/2rsUYvStC5V+dVPl61EW
	 3pUMwDFjvsb3hgfgjz80oq5LnskVCAhY1vUZLbprll5PBIm2J1MUc5cqSOVfmaMrn
	 kALjRasDa37Pl4SVotDJCNAO89VjcSw+uAOnq4G8EIW449h5M5V19AcHnKwk9HAVF
	 FnHkeLMiaSh4M8CpwpmJzzSBsLghDOkfmteM2Ra1VFkqTomQpaQyjK/7t1G6pk1iZ
	 KsktK0tX1ksTGSwAvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1wOkKC1hUN-016rXl; Thu, 12
 Nov 2026 14:05:39 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 6/6] ARM: mxs_defconfig: Enable EVAcharge SE peripherals
Date: Thu, 12 Nov 2026 14:05:05 +0100
Message-ID: <20261112130506.12823-7-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112130506.12823-1-wahrenst@gmx.net>
References: <20261112130506.12823-1-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZKLNncQ7J5u4BLplbQsEi+NWTrHCmlORn7JTYFwNS6KWrOuSQTb
 pffGHkoYQRMnT2ifgeOhNzscibMVthdAK2tGoizKBd4cKTRRdVafiURvud6pAK/0hcaVykm
 VUcy1x0JRjFWk4W0KZDsa61YKCZu8EOY020uoYeadwAA/x0gMZxgbsecCDvFEhYwEegHtbw
 wANcZgLSklRn9W+cEAfXw==
UI-OutboundReport: notjunk:1;M01:P0:YWm0RUUJjwI=;IZg909yJh5QkzN96myrcGlnks9B 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_050541_522031_7CC9A67E 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

We need to build the PHY CAN and the QCA7000 SPI driver in order to use
the peripherals of EVAcharge SE.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/configs/mxs_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconf=
ig
index b0b5eb33d01e..456378a53ea0 100644
=2D-- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -52,6 +52,7 @@ CONFIG_SCSI=3Dy
 CONFIG_BLK_DEV_SD=3Dy
 CONFIG_NETDEVICES=3Dy
 CONFIG_ENC28J60=3Dy
+CONFIG_QCA7000_SPI=3Dm
 CONFIG_ICPLUS_PHY=3Dy
 CONFIG_MICREL_PHY=3Dy
 CONFIG_REALTEK_PHY=3Dy
@@ -132,6 +133,7 @@ CONFIG_MXS_LRADC_ADC=3Dy
 CONFIG_IIO_SYSFS_TRIGGER=3Dy
 CONFIG_PWM=3Dy
 CONFIG_PWM_MXS=3Dy
+CONFIG_PHY_CAN_TRANSCEIVER=3Dm
 CONFIG_NVMEM_MXS_OCOTP=3Dy
 CONFIG_EXT4_FS=3Dy
 # CONFIG_DNOTIFY is not set
=2D-=20
2.53.0


