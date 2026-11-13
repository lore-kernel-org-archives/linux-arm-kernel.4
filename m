Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAD606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bca2QyWx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJDlC0WP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uOLxAE8UpwveT9Vb046h/+v+ZBvoRBoYnk4ZAFK6wgI=; b=bca2QyWx+i9WLc
	lxQMjapL4Gfxh2APLT3z35q7+dXH+GNowfTZakxTllGmkjRaPnSD8Leoot1OnOUaT3d54dPwNG3T2
	oVmGrrVhbGQb3UmmD299p8OIv/VgGrYytCJfJPSR/D8xp1Hrydv4O2Fwqof2SNm8pbsmWbXU/mL0m
	31+SkWW5FoKKWwvKNhEYOo6E3fSm/whGRHBeLRlWoBC46OUNbsIG38VrwEnSyLbjVGq0nFae0Cbk4
	cmiRzmE/CbPS5PTvz1zuJPts9KmyVr8KycFNec/b3unGOC8Ma6ZdyTCxxE5rjgWiwwVWKObl0G9gm
	EGedrSI9EBazu+9kEODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrut-0000000D5AJ-1rDS;
	Fri, 13 Nov 2026 14:06:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrur-0000000D59w-2aIi;
	Fri, 13 Nov 2026 14:06:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5C976275D;
	Fri, 13 Nov 2026 14:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3501F000C5;
	Fri, 13 Nov 2026 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578768;
	bh=uOLxAE8UpwveT9Vb046h/+v+ZBvoRBoYnk4ZAFK6wgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QJDlC0WPT2BDwWoKDtYgDcMV4xy5wu1QPk/1sy7FBzRWy0JnC+5L1dpxbUygfitRH
	 DEJ+7IWgRSov5AlWtf4bH1pu1V5UnEkZ23ZBFehQVulmNUGJ6kdmbFJWEPGiMeR/Yh
	 DUrGwLzKhAuFgz8+HVjfLQd4WxrQ8/UJ13nozQVAO+Uui3hqr36ZrNEeup8gYFx1Ya
	 g4pUB47QMPJjHxQOequlh8kNaQPy3q/6R97yVZt45wJFwI0Zt03xNgZFYCPpyOTxyN
	 MLuA5XRAybko6c+dC7Prl73a/2paQDP0edBpJmc95ZN9/5KDpw3kAbi3rXS4GD5Ji6
	 lET+RJpeE75pQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Support Opensource <support.opensource@diasemi.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, 
 linux-actions@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-omap@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com
In-Reply-To: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
Subject: Re: (subset) [PATCH 0/6] mfd: Fix potential cleanup ordering and
 lifetime bugs
Message-Id: <179457876458.61698.7594247052314866900.b4-ty@b4>
Date: Fri, 13 Nov 2026 14:06:04 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 31 Oct 2026 00:54:23 +0800, Guangshuo Li wrote:
> Remove child devices while their IRQ providers are still available, and
> avoid deleting a managed IRQ chip twice.
> 
> The changed driver objects were build-tested. No hardware testing was
> performed.
> 
> Guangshuo Li (6):
>   mfd: da9055: Fix potential use-after-free during removal
>   mfd: atc260x: Fix potential use-after-free on probe failure
>   mfd: palmas: Fix potential IRQ action leaks on removal
>   mfd: stmpe: Fix potential use-after-free during removal
>   mfd: stmfx: Fix potential IRQ action leaks on removal
>   mfd: wm8994: Fix potential use-after-free during removal
> 
> [...]

Applied, thanks!

[1/6] mfd: da9055: Fix potential use-after-free during removal
      commit: e8fe9e8397a935554eb61504934c76f9f7c32fc8
[2/6] mfd: atc260x: Fix potential use-after-free on probe failure
      commit: dc3431a385007486413d1194d36ebe9d83790b78
[4/6] mfd: stmpe: Fix potential use-after-free during removal
      commit: 259e272733575dbb4946829ad06eef6782ae91be
[5/6] mfd: stmfx: Fix potential IRQ action leaks on removal
      commit: 1235c2932f71553486eab2b76dbf40806cd2d345
[6/6] mfd: wm8994: Fix potential use-after-free during removal
      commit: 4c46825cdb45520f3a25f760e5c95f7b08191221

--
Lee Jones [李琼斯]


