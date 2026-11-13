Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bqe2UbB5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+Z15uu9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WUBFYZQH55+z5jKzytfsA7KDNf5BJ8Gm6r7VlBqjeao=; b=Bqe2UbB5M0DEqCpbyb2rUZzPt3
	WbOWsBI2xMVAWR3JYXvNn0WxsWpbKMeGXuTzZvCNBzGbEezAYIkvPRo/xFqPdvFuM07/1CtE/vGcX
	rzzhUO6RiuMQd/y1dkKdM50Z/LeBJ3dxg27NKU69nGZ2jRRvcNSX3u6JK6MSYMQxaaeEAY8wmYXjh
	QzGBPiLcP66S5bsdJLfaN1s4dlo8fzJcZRmZONQsA5d9kjqiCr2+6IZqOEh3pMSBO2U5lw5ADARhc
	rhZBcl/8jyhbh7WqG9u3itfcFgdZ0F8E8YsMFO+IQBexZRWS/Ilo3RSv3bFbiWFaH4yH/abQQ++Ee
	W9Ntn1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlXt-0000000BsFB-2pdN;
	Fri, 13 Nov 2026 07:18:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlXs-0000000BsEz-1s3Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:18:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C098C43D53;
	Fri, 13 Nov 2026 07:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28D11F000C6;
	Fri, 13 Nov 2026 07:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794554279;
	bh=WUBFYZQH55+z5jKzytfsA7KDNf5BJ8Gm6r7VlBqjeao=;
	h=From:To:Cc:Subject:Date;
	b=d+Z15uu9fU9H97SrHHJ84+i2bl8T1jC+Ju1FiIX3NqMmhigiB35+MWvOslAW1sIKI
	 NKW1r5jAmln6CpFUSt76IFZBJ2c70d8Zulw3JbAR/tNjtdwoxIV8C8brhpb/13KpW5
	 j/iRNkWB0bjQrrG8uNZCeUCufmfhZSrRUN/HV8c+Wczo0YWEDLGR2vvj/YkSzxWMbR
	 3AHxFQ3wtR0ev/DDAc/dC3XbJSvVDpTdpCScz+bAB6qwZ/utCa+m8WaR0i4Tgb3dGd
	 oZ/Gg4RHdnuQD9H6aXFP14gRacIgADuDyC0E/++R0307xPw41hSoaFYee7zc7+Dm2f
	 NR3aHKvUI5oxA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL fixes] ARM: dts: samsung: fixes for v7.4
Date: Fri, 13 Nov 2026 08:17:51 +0100
Message-ID: <20261113071751.14775-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=krzk@kernel.org; h=from:subject; bh=7blAMNaFbCVmZJL3/1WWp1Fv3fHsNraTOPYC8gUTqDw=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9rmfjs7NvFEs2c+iXgBvBk2M/dGiaXRXYrHQ7 XZ/u1xDgbCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCava5nwAKCRDBN2bmhouD 1ydJD/9NXD7ST92jdlzHxDrzecDq+o0tOSYgnkjUYVKXAlOYrKaNnI4dbq4NUNyA+W84obei4Ps fQNz9I+ywgAHlmvg3Z/PalN97lPPbXiCC1mq6Wb+222BvoALHPFLD90EuIMlS/aXHdDBvze5y+H V4r52KlB6qCuDrGr2obJGvhxTMNFdqYVZPaa0erFXLjpIU/ILbtwtNR8J+Ds9OQNH/ZnA+GD8gX lQPz6AfRoUXicj3W3+jTlJskjsQV2IrCdxoT4475irSlezHyeybIiZ2CMkMKLfKQmR6exnjs8P4 agUTiTrPs6J1VXNoFOnP7HU/TSRaFF0W01Wtz1HNchdfjWN+flHKFf+YrfUAtLpDtwGGVtI7nzd UPO+TLejyuVY0rPoeuui7h4f+GJ0LqzgBsfAqScgpfZxKUYghUndnnmrktWXqyoT3OVy6GRatGs hWymC6S4xmiKsXp2/q13BGovQJV4ypiYfmOC/8Ir0Avy6hPSSt7NqTxkhDJ63rikuVTHF6J+IdX 9UMGsR7k1kuqFopFXt+HUogeoGKfenQAGbu3hsQLKDpAUL1xvdwO5SM4jLTAJ4ApE843qY27P4k Uqw2HK6p/1FSlWBdrhhioFYxCzTeJ3psbNjcUgpfl27UZM9G0mHY9Rci0EM9qdbNB2LKBEk5dW6 xJzOg1E233Ffinw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-7.4

for you to fetch changes up to a6b33da67ef16a4bdf359d4e76870b1ba1a1360a:

  ARM: dts: samsung: exynos4210-trats: fix BCM4330 Bluetooth GPIOs (2026-11-02 18:36:37 +0100)

----------------------------------------------------------------
Samsung fixes for v7.4

Fix powering on/off of Bluetooth and WiFi chips on a few Exynos4412 and
Exynos4210 boards.  The WiFi of Exynos4412-based Galaxy P4 Note family of
devices was broken around v6.14.  The Bluetooth on Exynos4210 might have
worked depending on the bootloader initialization.

----------------------------------------------------------------
Artem Utkin (1):
      ARM: dts: samsung: exynos4412-p4note: allow powering off the wifi card

Marek Szyprowski (2):
      ARM: dts: samsung: exynos4210-universal_c210: fix BCM4330 Bluetooth GPIOs
      ARM: dts: samsung: exynos4210-trats: fix BCM4330 Bluetooth GPIOs

 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 11 +++++++++--
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 13 ++++++++++---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi        |  1 +
 3 files changed, 20 insertions(+), 5 deletions(-)

