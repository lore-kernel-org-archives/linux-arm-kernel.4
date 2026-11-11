Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21466070080
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jPm9mZCM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqVq9XjE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mtRwj7jd0DiYu19HtXx15Rst1HSYAjuntUvy+oixF2Y=; b=jPm9mZCMgG09UJEKr+b2e0/Mik
	Rsq0YUQmDL0rIYmjQlSHUatiZv+5iHnBZJ7/ZtLh8dhRPptLAJI+/yRgUX6xWC3bXGJJ0QDLfwSqT
	t46U+LEXogxCWnRDPB/Mc7IL+//t+gPwy+P1oBLlheMPYKBzJmxwozv2zG2+r9wloiC+FjOGFpmLh
	oj6W0X7SZJZvY9eDJag/t9ztou5PzSzH/VQfwVXjcqGjLQUQ4RF7Jf2phSGLrXjkDhcPo0z21afOM
	nGNwrsVNH7CgBsJqnKZyU2tdHjc2bJv7y9e70IzBTVg/V6jdb+NUP3QegDspm5hQnKCpfSeDzc9+Z
	PWeHsFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBH-00000007XUF-44Dk;
	Wed, 11 Nov 2026 19:40:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBG-00000007XTx-3vzT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0BBD455D7;
	Wed, 11 Nov 2026 19:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2521F00A07;
	Wed, 11 Nov 2026 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426026;
	bh=mtRwj7jd0DiYu19HtXx15Rst1HSYAjuntUvy+oixF2Y=;
	h=From:Subject:Date:To:Cc;
	b=BqVq9XjEZAeRNFCn6lDZ9U7Kgds5B/T6I7Hdy4ZZgjxg4O94d9AMoNZrr/qs4P4pr
	 j9ZjVl5LEn3pAd+nckA4vYQx3yvwXx2NPUBHdpj0T50p6sz5AV8vLc3/ZluhLrUvxl
	 ysxMQYdPlvhoUq5Qbycpmyww9wlIAwsHED4PGgfDx8+KEUVhG3q/5Bo6dOb1xfYi2T
	 w5PT2e5+hUEPxwPllKXYed7wDYUurw6HHuM7UoWlTgaAcrCwW0tEl0yRG67dyk6aZu
	 VLmEDgSsG5xP77a63JTS4E84T4PEm2nvHGOnInttTngNG8lHBVX6vUFJkNqNlaH34i
	 Apx/xuJ5ozQ6A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 00/12] arm64: dts: hisilicon: DT warning fixes
Date: Wed, 11 Nov 2026 13:40:10 -0600
Message-Id: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw5AMBAAf0X2rIk2HuFXxKHaxTogXUQi/XeLu
 U0ymRsYAyFDk9wQ8CSmdRHRaQJussuIirw4mMyUWlB+71lN0qm6MNqgzbyucpB+CzjQ9b3a7nc
 ++hnd/g4gxgcaFcYRbQAAAA==
X-Change-ID: 20261111-dtbs-hisi-95212ea0d174
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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

Another batch of DT schema warning fixes for HiSilicon platforms. This 
fixes most of the remaining warnings on HiSilicon platforms.

It's best if the whole series is taken together.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (12):
      dt-bindings: mfd: syscon: Add HiSilicon register bank compatibles
      dt-bindings: mfd: Add HiSilicon reboot mode syscon schema
      arm64: dts: hisilicon: Add specific syscon compatibles
      arm64: dts: hisilicon: Describe ADV7533 supplies
      arm64: dts: hisilicon: Drop HiKey DSI endpoint unit-address
      arm64: dts: hisilicon: hi3798cv200: pinctrl node fixes
      arm64: dts: hisilicon: hip05: Rename the HIP05 NOR flash node
      arm64: dts: hisilicon: Move non-MMIO nodes out of simple-bus nodes
      arm64: dts: hisilicon: Correct DMA node names
      arm64: dts: hisilicon: hi6220: Correct I2S channel ordering
      arm64: dts: hisilicon: Remove obsolete HiKey970 PMIC GPIO property
      arm64: dts: hisilicon: Remove unsupported SBSA UART "reg-io-width"

 .../bindings/mfd/hisilicon,hi6220-reboot-mode.yaml |  34 +++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   4 +
 .../arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 138 ++++++++++-----------
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  17 ++-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          | 119 +++++++++---------
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi          |  26 ++--
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |   4 +-
 .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi |  69 +++++------
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |  11 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          | 118 +++++++++---------
 .../arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi |  10 +-
 .../arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi |   8 +-
 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi   |   1 -
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts        |   2 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |   2 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           |   5 +-
 16 files changed, 310 insertions(+), 258 deletions(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-dtbs-hisi-95212ea0d174

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>


