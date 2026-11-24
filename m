Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fCHBwFtq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7jem7i6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zeFv3YDJfMWmLnU3xbVv+JbHwMFIw8/a+m/T2fCIkx8=; b=fCHBwFtqjaGSQF9ZqjNERY6Kho
	rDzyRpCn15EbPaj9Nnq544SJL05ZdFkX9TkfT5eVnF3ATv7m7PWtnrH3NlA/hbrR9flP/adLpMHi0
	QvYmybtSdnaxZc1TPSwcDtjVLP4xyL37KIhrdlmCDJJO6Dng3GfEdaRHTs0UEqDEr4FV0irlplORv
	gbVzOsKtc/WaYeboF5Wla05+AO/jbS/jR6VjzF/6aH4oIzdi7OWJSzQJrdueN+QBNatcuE2Spp0EL
	r38Dj5W2/d6mQDrqEVRhRGvTQUw5Cl3ArxfAJpO1wHyoz+Vstjj19r4cTvsgLekU3h/bBTkVTHv5D
	oBMSLhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu6a-00000007Jdu-2l4p;
	Tue, 24 Nov 2026 17:14:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu6Y-00000007JdE-1mLN;
	Tue, 24 Nov 2026 17:14:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 044B843FD5;
	Tue, 24 Nov 2026 17:14:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795540493;
	b=O3hqYPKxcbQXa6WGxVV2B7+ibZX5adpS28gQ8PCQfCOqZlhtixTUi02X0m/mfpOVjyxj
	 aM0Yt3Kq9whH50YLSF4bAB3aY2OGHACDmquPQn58B2b63+5ktQeo+XP6q0uWStbhyZImS
	 AFnrWHGIAFqajZcGabtDGm2iEKFX0QTiiz7U3jt30nPF8f2e5bgk9TDvofaeN8N7nVnqg
	 u2Mch3MvrmKhGHty934cIv44V2V9O04NBV5YZ0xf8JS68AoBhYGi14UxORLDq2oAqCm2P
	 KweUg9NnKEcTKQjbAPF2j0VHL9Gj67Pe3bgUgfAh75Ed0uM0WHLY66ewyLN7zujqaVQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795540493;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zeFv3YDJfMWmLnU3xbVv+JbHwMFIw8/a+m/T2fCIkx8=;
	b=OahNUKNPGvhUVYiRhY4hWIjeSyK0017RdePtabIb7bTsMQBNQKRgBcdtGMXSnHFgUaA4
	 PXR99LE2izGrm+as/mFn/ft3L2r1vfK9HOgzMIbqr+1VkeBX3gYDE4986q87CDdJn2Y9S
	 Lg0srKhwhaZBHbkx8BHP6kxaiPpvbycuOjCB3k8QsZ86MGYwbHsdIw0UKqSpJ3jNlzruG
	 HyQQ9Zgf+bBcyxxiG0K1F9f+egySfaKjb+S3JCkIxhjcsoLXcFmXpdkFEQgU7dDSNFi0V
	 MO1UNjoMT42wzZ4FXOeqae5qVPOZb7x1ohO8zZZ9XCo+1Wf8V5c9Tx9Lx2eEeg37dbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CB151F0156C;
	Tue, 24 Nov 2026 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540493;
	bh=zeFv3YDJfMWmLnU3xbVv+JbHwMFIw8/a+m/T2fCIkx8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=A7jem7i6NptkftQfow6gd6tXMsuMEjy3Antte9+jtomGq1Epd7tsKnkX3ktfT4pt5
	 nZNknLP0S9lT4GKAlnBWdqAF6uZ+vO/aOs/DqpZcpoIOL/DWf8LPh6lZ07NIN2DBQj
	 MyIGAzUuMjASxx3+JrgQwgSTQC9bO2IWQtENfU5HMd42in3sUa8JItaUBwiZteziAl
	 Srhmu56wi8tFNeU5YDmYfnH61nNAXwQmMcgNWr21vzy+kcvdDhP1VKgjEQb5imRhbp
	 ThjwGN7xpjSypvACTuFXtDAoAKum6uHaeeDhgsSmQCZIHmhpErVBzeXRqS5J6v/nYc
	 D/K8KNv5YzCZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 60A524CAFE;
	Tue, 24 Nov 2026 17:14:35 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Subject: [PATCH v2 0/2] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
Date: Tue, 24 Nov 2026 17:14:31 +0000
Message-Id: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0K6toYWi+DKexgWLQwwprSmUwiEc
 HcBD+DyJe+/vzKCgEDskawswISE3u0gLwmre+064NjszGQqcyFEybuos9naCHwkw42OEcLCTan
 g1hSlhkKxffsJ0OJ8dl/Vj2k0b6jjETuMHin6sJzHkzi8fx+T4ClP61a19zxTUsJzABe1tQtpB
 4NGZ9FBoKsPHau2bfsCNwuHCd0AAAA=
X-Change-ID: 20261119-gta3xllte-usb-battery-b95e4d89ae85
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Henri Ommer <henri@ommer.net>, 
 David Virag <virag.david003@gmail.com>, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540475; l=1538;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=DAbTxT7juIbYgrW7oPFGFfAP35r9haHx3DRvlkx81nY=;
 b=5u5JzQXguPwZgd20NoD1oFChHbxoRiu8ukXHEVrS9kIdvqu3ceo4WL4ihus8l0GK8Uc/SkrDQ
 o2xb7qia5wvAcwqSWIcAXQ1QOgsXH5xF0wwxoGCf+oR6A9REvB8sfqJ
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi guys, this patch series enables USB and FG on gta3xllte. All is tested.

DT changes were tested with make dtbs_check W=1, and the dt styling check
scripts with --mode strict flags, both of which returned no warnings.

Please note this patch now depends on David Virag's changes for USB[1].

Best regards,
Umer

[1] https://lore.kernel.org/linux-samsung-soc/20261123092244.1792040-1-virag.david003@gmail.com/T/#t

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
Changes in v2:
- Drop patches that are being picked up updated and corrected by David
- Link to v1: https://patch.msgid.link/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Umer Uddin (2):
      arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support
      arm64: dts: exynos: exynos7885-gta3xllte: Enable FuelGauge support

 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
---
base-commit: 9b369f9debe1253032abb90a9469fe44146835d1
change-id: 20261119-gta3xllte-usb-battery-b95e4d89ae85

Best regards,
--  
Umer Uddin <umer.uddin@mentallysanemainliners.org>



