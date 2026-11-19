Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6108606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j2IukA5C;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TfdmdYmQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3VTybhTqKJAZ/JbIkL/pP1pBqKL4V+l0hnFbRL9gv40=; b=j2IukA5COSDaka
	/ARLX/qWezDxHCnUlw/SamSJKLfYrCXQ8azjn8IDstwm4KXGSWj7NZ8ikiHQiZZiqSblIA95MxNVu
	v17ngZj7Ps91yrK+W62FJHZlWuu+rZmyEa8LrQeCdVYC9wjvorSH2Y+q8Z6Wwn2489YzCcVpRmjb2
	+OoyoDc8MdMVqz/W2RRFH3mI17LLSWJo6Xy//c+dprn4M/3ODp7HIjMYu7lutlsl5aX/u2ASFfcUS
	A9HRtPygl7bmo19hp3APdbbFMT5Uwzu0eE1SL2O1S7o6BSXEccf3cVNmYwWb7KhvNQWoM4NAupOGW
	s0kZB0w3GGddxzduhiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU68C-0000000CrxH-3mco;
	Thu, 19 Nov 2026 17:41:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU68A-0000000Crx3-48PZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:41:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14C4160E1D;
	Thu, 19 Nov 2026 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B3C1F000C4;
	Thu, 19 Nov 2026 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110065;
	bh=3VTybhTqKJAZ/JbIkL/pP1pBqKL4V+l0hnFbRL9gv40=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TfdmdYmQS+qILgO5gTXBo2Qngno5vhyr+SgEOhdjYJN6HMwP/fF+LBN8U/nfpJlMe
	 rlkIyXifWTW4bW3n5J5KHhCsqx6eNrU4T5A7IMGf9wxbMfZh2+XmcLInWvZmHCpNtL
	 os2fqO9lA1y/MYnAM9/j/HJB9Xv7aPjBxJRPRKkK442SsKGl4jeNxhDbH5IBF+eBOP
	 MRVgDpluMZnTDA6VwKfJbdbWrLWScJ1THF11nWwJQjKk7xNCX7YjiC2/q/ZCcJxv8a
	 XdGPXWlIWtpsCvRkrBqOaxctkZqPOlkbg4ligJykmWsOUlCWbc9Jxg+Q5iyVNKZ14X
	 ScUUmI5nlerUQ==
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, mfd@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261113175712.4189110-1-Frank.Li@oss.nxp.com>
References: <20261113175712.4189110-1-Frank.Li@oss.nxp.com>
Subject: Re: (subset) [PATCH v2 1/1] mfd: stm32-timers: Use
 dmaengine_desc_set_callback()
Message-Id: <179511006340.87394.11961349474529132483.b4-ty@b4>
Date: Thu, 19 Nov 2026 17:41:03 +0000
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

On Fri, 13 Nov 2026 12:57:12 -0500, Frank.Li@oss.nxp.com wrote:
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with a call to the
> dmaengine_desc_set_callback() helper.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> [...]

Applied, thanks!

[1/1] mfd: stm32-timers: Use dmaengine_desc_set_callback()
      commit: 20288e5e843ec16a9dfd9e6449f2f635dfc654ed

--
Lee Jones [李琼斯]


