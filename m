Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F327606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tSvtpO8Y;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijeBnl1V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TbMTB348xWz+N7BbP6X3tZI2pVAnoZ6zbQ8KwiGJyoc=; b=tSvtpO8Y1Gz3S1
	5uYS+qouznqQpTO63L4727336Usu2CAAbOa/RKUAs5YP7eWFyX/05h/VM3MJVsuvJwtYF4MzoltMC
	mavXrmJ1qJc5gEZN/XEKPD/WqamkcaJz2zU978XZqQbmiU8HJd/U+/3l3rRYqhQetAHgPvKPRNjP8
	UJNFPgUXmtEx5mx88oEXGN85w/l3K30uGfa86OsWxh0PJzmNjlS1bjRcEMvbbAFDxdxbadL/lMXWj
	HVMaGok8GxJQoMv+LQL+yy3YRT5spo08/L2YuUAGsirP8YdJu8QLDw5eJScdsJ+e5fv6ijfQMNsh5
	CBXbyiFjwW+vtUoyYSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8F9-000000092pN-1x1p;
	Wed, 25 Nov 2026 08:20:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8F7-000000092pB-3vT9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:20:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EE2740899;
	Wed, 25 Nov 2026 08:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400E51F000C0;
	Wed, 25 Nov 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594841;
	bh=TbMTB348xWz+N7BbP6X3tZI2pVAnoZ6zbQ8KwiGJyoc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ijeBnl1VtRddbwWSzQrBgGhO/wZRm0/afwpx/KLKdU3byYivRyLH+40NmEyQh1Gy4
	 VaUJnxx9OKQsd4hnELD7kOe56d84SJ+WLhoS6MHPV0opMmn1QxLTqEeFZB7+ZMH1Ly
	 LqhkT54rfaDcUyKneqwwFGdpaaJ3qM0yDLwVX+4X14WBBUvc3sigEqhAQK3lh+GDAe
	 nhD/Vdum5lq7P89Tbkjiaf+LD/+/lt83tOBatJMnuyYW5yzNpWh9Gy06c/6Wyjr6vt
	 pBnxn5rkuPnauV7u0qJ+2NI94pn1Wzevj7xilsxis7QYNQmVGjr192N/wUZz5A760/
	 pJX3XTormA9Rg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 6/9] arm64: dts: marvell: Drop unused USB
 'phy-names'
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-6-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-6-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 09:20:37 +0100
Message-Id: <179559483742.14607.887628007861007504.b4-reply@b4>
X-Mailer: b4 0.17-dev
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

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> 'phy-names' is not valid without a corresponding 'phys' property, so
> drop them when 'phys' is not present.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/cn9130-crb-A.dts          | 2 --
>  arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

