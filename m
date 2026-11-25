Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001E7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hTvw8M2n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzJ+HvHD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Iy0LBKjBroedimxVaC/1j6YmBtkw1EAVLklYNel3/zk=; b=hTvw8M2n/3lgmGPRBiv6WdlZ/f
	6bsYPjWKRLx1Mwz6EWw4NW6WxQXagvG+83pFDNEpaF8xuUvKzwntV+ZSBc8WmewW1Ogrg/9Pn1OIO
	PMzEmoSACFY6+aN0gWOR36SIt4VjJIvyjBwUkBKF++Vwy4njxAM4bytZ6fbHsGFPn/DFsy2pKotO1
	wXAQc5FBZguRbkQh7YvEZj2WkhWXy8xTgteE5zIPvWWk9Xoa7NAJ3YzRLvAQdk+qfveLvUpGPcaim
	oPUBnuWAMoAcBuvANEY2e671qQIs0iNZRLilcP0Ss3SydH4h5kCe3YdT8xRaRmsVU+krxcDLV+dSY
	FY8alg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBtC-00000009mPT-1Sa3;
	Wed, 25 Nov 2026 12:14:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBtA-00000009mPI-3E5C;
	Wed, 25 Nov 2026 12:14:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8465740A07;
	Wed, 25 Nov 2026 12:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E6B1F000D1;
	Wed, 25 Nov 2026 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608856;
	bh=Iy0LBKjBroedimxVaC/1j6YmBtkw1EAVLklYNel3/zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzJ+HvHDB4WuioPqlB6xngB+hDQFIIitX/b4JQpeXskjO2YuLPvZrheYYoZqXFFYX
	 8/eo2bAhcpD9Y/jNmWjPT1WyJbFmcMHAscdSuO+FF8ahtJoik/Mnwd6C8AeDyD7I1y
	 bmBSOBIkLUrYa/UXuwz0NsN8KkiyurAjLRoMdg+bs9XwzUZ/z9NXSlxwa7s12IRd1q
	 XUIpN+JFxQNoLlA+H7NC5giIw0QQGBYDyFd2Mkvf0DkURAjU8ilELWDc/EpMHYaNmF
	 x+nf+IWrj2QncJKbFn9B6kHRarPQhgpu0rGEa5bQyuEKGevxrKpy4Y2CSCjvO9zthc
	 oDQ7DS/njv8Pw==
Date: Wed, 25 Nov 2026 13:14:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.5 #1
Message-ID: <20261125-practical-stalwart-ammonite-e24832@quoll>
References: <0mz4dc8hQSOr4_mBKfnwog@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0mz4dc8hQSOr4_mBKfnwog@sntech.de>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 03:02:59PM +0100, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below a first bunch of Rockchip dt changes for arm64
> for the next merge window.
> 
> Nothing really stands out.
> 
> Please pull.
> 
> Thanks
> Heiko
> 
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.5-rockchip-dts64-1
> 
> for you to fetch changes up to 30eb5fd93649928b9e4149d24fa182c8521fdc20:
> 
>   arm64: dts: rockchip: Enable all CPU OPPs on Kobol Helios64 (2026-11-13 21:35:29 +0100)

Thanks, applied

Best regards,
Krzysztof


