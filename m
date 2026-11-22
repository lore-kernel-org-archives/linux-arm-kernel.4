Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0866606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WvxVVrum;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWwKleOb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b50zLsvvGRcvgvDriMx8gDLrh8tprTr6wGiggUvHjMs=; b=WvxVVrumiIga2YvKI2EWJAlWvf
	ydPKiG7A+Uy7Kw+dBvbsNUAlHosZGkwacW5mwXh6HP4DyAjHZ5NnZ62hcV8jZ/iY9V32qt1aWzg1v
	WZl4qLMEkA/krA4HiJzR0wiPuyovPZ89W1OZ/foT3Eyn7A/CKXn8vRGiMk050/dBuOtTCun70cGMd
	ShjN7unrncAnT8jqV2JKIlKsDZjRI91wDlfg2R5JvQLueH/bNnILgxHEA6bUOYvpRBeEv9SC0p2H3
	CdV67iLtUFQ3uq/CtK25x3IxFLB24BQf/GJwF16uZQqoiz5Purmta/QQqLRneCJJKR0fD7/TQF0iU
	M/TWPAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFMx-00000001ofd-2ZT8;
	Sun, 22 Nov 2026 21:45:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVFMw-00000001ofW-0zw0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 21:45:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 585BC61754;
	Sun, 22 Nov 2026 21:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65CF1F000C0;
	Sun, 22 Nov 2026 21:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383903;
	bh=b50zLsvvGRcvgvDriMx8gDLrh8tprTr6wGiggUvHjMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWwKleObXQWz2vPfgUCmrj9fEWZy+oV4RnyXyKIEv4G8dYb3DKdAbPqRIgWIZ+jQZ
	 ZWjUbYWnPoA5XLsCcBlwscCCWQYz6AKWhzfvOEwO1fl1wYepe9cAP7R2WKBWMciuTm
	 3ueObXfw4I/Vj899wB1YlBZ37+6ouHyWasbO9Mf5oSnKvbE9CBEpozMZcN4k5ERJYD
	 rwa6FlHJv5QzZ/7xHppRI5mDQ+Ilt3cssTp8yT9R49sIwXdAMVckfV+8y6iF4xvPd9
	 fz3YF2nr2LtFk+EQEJPG5zDpeyD0mnlbX/1+elOO7nvrMj3zwn7nZ62Xal3Smkgkfu
	 Vu/XDlDzhmMsA==
Date: Sun, 22 Nov 2026 21:44:55 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	David Lechner <dlechner@baylibre.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Grant Erickson <marathon96@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>, imx@lists.linux.dev,
	Joachim Eastwood <manabian@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Juxin Gao <gaojuxin@loongson.cn>,
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Naidu Tellapati <naidu.tellapati@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	NeilBrown <neil@brown.name>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Philip, Avinash" <avinashphilip@ti.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sai Masarapu <Sai.Masarapu@imgtec.com>,
	Sandipan Patra <spatra@nvidia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vaibhav Bedia <vaibhav.bedia@ti.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	Xiubo Li <Li.Xiubo@freescale.com>
Subject: Re: [PATCH 0/8] pwm: Fix various bugs reported by Sashiko
Message-ID: <20261122214455.GF70182@joneslee-macbookpro.roam.internal>
References: <20261105143847.2559586-1-lee@kernel.org>
 <awA6F830Ve_-vXBg@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awA6F830Ve_-vXBg@monoceros>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026, Uwe Kleine-König wrote:

> Hello Lee,
> 
> On Thu, Nov 05, 2026 at 02:38:02PM +0000, Lee Jones wrote:
> > These issues were reported by Sashiko.
> > 
> > Lee Jones (8):
> >   pwm: tegra: Prevent 32-bit period truncation and division by zero
> >   pwm: mxs: Return early when disabling and fix error-path clock leak
> >   pwm: loongson: Fix 32-bit control register truncation in
> >     pwm_loongson_set_polarity()
> >   pwm: axi-pwmgen: Enable clocks before accessing hardware registers in
> >     probe()
> >   pwm: fsl-ftm: Enable ipg_clk around regcache_sync() during resume
> >   pwm: omap-dmtimer: Handle negative error codes from get_pwm_status()
> >   pwm: tiehrpwm: Enable runtime PM before registering PWM chip
> >   pwm: img: Unregister PWM chip before disabling runtime PM and clocks
> 
> I applied patches #3 and #4 to
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-next
> 
> , for the others there is feedback to address on your side.
> 
> Thanks for your patches, very appreciated!

No problem.  I'll turn these around shortly.

-- 
Lee Jones

