Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03128606A6A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YlPMULtd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4EKObBl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bM3ZC9yu5XH+6bnUPNa+jdnnx+eGcgI8D08Xng9WN8E=; b=YlPMULtd4/o7I92enqZICpLOhg
	dn2nmkWUR9dBLT1bSXS725JCVQ2h7PbX0b+2gFo0nkvz8b7hde52SCZfO0u6LULTogcecP9dao9ul
	i/jwkpX5srnY1Zt8CFvUJHXS3qD4/0x8U60CDr+K6uv4fnEyeqiYjpyaPlxJtru1vGe2p1T7Uobbu
	5Jhp7IdpEANXKavCqzoNKLqRB/Vzz7b4ZU+tX5V3/87dgqXcdn+eGfOqYNLIjvDMyma+F57X3XzTn
	wnQA3/Kim1O1Sgo9D6DSPtTK7ZAebzArG59DiRD3GaG1eq9aTy9Z7IF4j3QeDHq7Q9pmIwCCYgZXh
	U1FUuTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgJN-0000000EVGg-0WYk;
	Thu, 26 Nov 2026 20:43:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgJM-0000000EVGT-0w0r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:43:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1794410F9;
	Thu, 26 Nov 2026 20:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0151F000C1;
	Thu, 26 Nov 2026 20:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795725799;
	bh=bM3ZC9yu5XH+6bnUPNa+jdnnx+eGcgI8D08Xng9WN8E=;
	h=From:To:Cc:Subject:Date;
	b=E4EKObBlHAmUhpLsKjFSdoTnJ/NhxM4BCRxUirL8IM/r8aRM54FYAKohozTrB/b8d
	 Gt8z30g7oTksu5eXkKgQwu6huQiIlmwY/iNFySnXKNCe/0R9D7GHA9zLjjGhaMi1HL
	 7dojc6kic9Lsr/7Meu28a3snSU2Um9C6FQ1TJ/7UmiXlAZwNlo/9BINH6WsYdmSRox
	 YQ5ReWJEky8t5tNnp3utsZ9IYLWzikSluFxCxDdn77yaZ93Bq6AkRxQRhdIOHi3Fuh
	 5Ba0pDIz/2DvvMnjQwQSUbHJJLLaT9MrmK70uVVT6/Wtxg09UPIMS1FQbRg9LdUvxK
	 15T2Yu/7BA7Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arpit Saini <arpit.saini@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.5
Date: Thu, 26 Nov 2026 21:43:14 +0100
Message-ID: <20261126204315.15005-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.5

for you to fetch changes up to 1ff72de9902a955b8446bba2c56942028c1425ea:

  arm64: defconfig: Enable Novatek NT37705 panel (2026-11-16 17:44:40 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.5

Enable the ILI7807S panel driver for Shikra CQM and CQS EVK boards and
the NT37705 panel driver for Fairphone (Gen. 6).

Enable the PM4125 audio codec for Arduino Uno Q and Shikra boards, and
the WSA885X amplifier driver for Shikra boards. Enable the Hawi LPASS
LPI pinctrl driver for Hawi and Maili platforms.

Drop redundant Qualcomm SoC and interconnect entries covered by Kconfig
defaults from the ARM and arm64 defconfigs.

----------------------------------------------------------------
Arpit Saini (1):
      arm64: defconfig: Enable ILI7807S DSI panel driver

Krzysztof Kozlowski (2):
      ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries

Luca Weiss (1):
      arm64: defconfig: Enable Novatek NT37705 panel

Mohammad Rafi Shaik (1):
      arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

Prasad Kumpatla (1):
      arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver

Srinivas Kandagatla (1):
      arm64: defconfig: Enable pm4125 audio codec driver

 arch/arm/configs/multi_v7_defconfig | 11 --------
 arch/arm/configs/qcom_defconfig     | 10 -------
 arch/arm64/configs/defconfig        | 54 ++++---------------------------------
 3 files changed, 5 insertions(+), 70 deletions(-)

