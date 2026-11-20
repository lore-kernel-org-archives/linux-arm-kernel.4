Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE87606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TkCLe4ID;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A5kz3H0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=; b=TkCLe4ID0N0WUHIrgw+7s0q0ex
	RnltWxlitWOzWwurx8jB+E9Z6N1ixnLsptd0TS72ht89mpKQYDY/Sxf/6c2210kyGwNMUURFKydaY
	pUy3jZ41Q8jbN7nXJqEjHsCONvI9XZt5rVEJtD1kDd/hOt7a3A1malewEcfUiHkBqBa1qmeI2sRTY
	UluaWLhFc257FH3YLCMSzGTHCzvak9y3q6FlN4dZXadFLSUgqVTVcQgQOmcws111FCVcWIGc0V/EK
	qyz+7rqaHJhF/FCKv2GYD67RvpdK8iuArF+Iqshe5vapq623rASDlJm95NfKbG/IocgOz+UH7xaD0
	4wqgbN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQNy-0000000FOBE-2Ukp;
	Fri, 20 Nov 2026 15:18:46 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQNu-0000000FOAT-20Oj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:18:44 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8b6b22be970so443870b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 07:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795187921; x=1795792721; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=A5kz3H0myRiC4A2JCSnvUwThp4kPB7B1DD+L1Cbt7BqgxRiXtxqI8WKmh8Nc/N7p40
         3okhB+hxmu41zMXHzezLmJWUJyV60SWwtTkmjEihsiMjecuY54EqzpQKhz5AxqliMFQK
         2nH6bMpVVvQQhON51AT5Z5V7XpIZfPYD7g9NgcTVJClR9hmm5XdHmjCWr6GS2QPLU8dN
         6YkEnu+Rp6VOO541pXj463YdMuCOrX2JPnzuQVRnoAmsT1SywUfAGUeuHofrTr+fs5kc
         y51rgnrGGN8+uzuUUTDyAR066ETxNg/huYM3Z9HHFqhl1FwvlVTGB0p5l1W8pRb1h1z3
         93PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187921; x=1795792721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=K4dKYEr+AXCI5l1BhD0yuU/Qx2xZ/5IC7YTiE5QVpmud9+6/8hYvybTMeoy4AGnlw1
         1Z+A04EtvrVYYYGVC7LII2AwOzDM64XlKAzvt0oR4jyzty7IOEa3sdW2O0WeTCpHfIDy
         5M1RE4AHifp4GNmTGPBRAK59aEAQCSwpaiTONGkie1DwzAjZ2hk8x3nlYU/qWhMTuHH6
         gNpWo56SeAzk5ZcAeOhaR01Bt9zpUNw58imycIsZY6J7k1BZjddSO4xSEIkNGl9X7r2H
         DNJxpmoQ4e6Rp4M7oKsKavWZTPkeQjUm3F5Ze1QrgEtqidmQrXS3wXSjxb+1QXs8B5n8
         KWCw==
X-Forwarded-Encrypted: i=1; AL+hErF+XH6ClqtiFAN6AaYcBUDlM4ZJCnP/lm5ZI5plAmTAenPqMehK+lLdgVmO1cXpyMS9ogQQ/eMBjy4JXPb8vTk9@lists.infradead.org
X-Gm-Message-State: APuU4Z80a23uMtwDhUz5DErXwFG4agRino+zbnyk8E5CxbULV/OKNGK8
	oR14LEVokGHynGi8lZS/khdmSCl33dCtSiA56YZqq6zv2sMXoGzBtT94JILjtY5mnV8=
X-Gm-Gg: AYBFou0rlM8xHuoW1BWND6fViDwqdl2vIfZLSIu13F/tzhhZ3WaCLWvQvykW/Z8pWSR
	6aoeVNhe5YjNHw7wTt3jOuwp1roVHfGhwPo1lYaU97vEn1D6g/XFNZbMsZxOGoSh8V6Wm9tF48F
	GH/9wCtNMnPHtAE6dxMNU4bnx/bllr3qlmgeZ4zJiPhPOTwEsKRJTl9Em7uNGKL8xLLIxW7/Ypn
	BtD2VaiG254JuJ2gbsB++X9PbZX2PnxcWsvK34vQNSRmquuhavcnjEZ2sCtrdRcbUoums5tYrgv
	SUA6+D4oJSHqDUgs11okf6ortHvABBCL+wsf+bh+hZ8XMdLK9UgHsaY1pF7FoQRkT0zbk31UrX4
	ZRRxCaiEKz/biQ/bGNolJoaUHlUs4HLsKIB0wif93U9H+VFCZgkk1a+3hh6NyYYkttzqqmO7iyq
	PQJbOJ/8R6qPyt1hhN6d+qQbKRRVxHBhjpVeViQMC8phKdEk37U+pli1m3Iie52HYCgkg2FpGRV
	3bM7tz19M/LIFtMrj78CVYLOAWgWAHOU+hL6Gq/69QEDBuga5oZO/870n8HGuj78YTyZdtAkuCe
	YyIi0GNUTBQWdgwSPo0908XiC7gpzSNp
X-Received: by 2002:a05:6a20:6a1b:b0:3f8:2d33:217a with SMTP id adf61e73a8af0-4014e35c5bbmr3604027637.59.1795187921441;
        Fri, 20 Nov 2026 07:18:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm1534544a12.0.2026.11.20.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:18:40 -0800 (PST)
Date: Fri, 20 Nov 2026 09:18:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <awBkzr_uxBxgeLvs@p14s>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_071842_609630_13D60C83 
X-CRM114-Status: GOOD (  16.24  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 12:39:49PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> Changes since v3 (available at
> https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):
> 
>  - Improve kdoc comment for new callback describing what it is supposed
>    to do as requested by Mathieu.
> 
> I'm currently working on another remoteproc driver that cannot use
> rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
> into the local CPU's memory address space in a useable way. With the new
> callback the amount of code that must be repeated is reduced, similar to
> how the imx_dsp driver's load routine is reduced.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
>  include/linux/remoteproc.h                 |   7 ++
>  3 files changed, 74 insertions(+), 117 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> 
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> -- 
> 2.56.0.rc1
> 

