Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5215606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dd1ByByi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID6rWIt6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OYNOuehFr9NKTiBYghlfnXrv0u5UnoGpuXJ7k9IkVak=; b=Dd1ByByiBw6qoj
	rgxmYK7XSIoqJJP2p6ot/xU8UN5o7FzNbG/yAmFC7jsyr0GtbMVzPjODWDBUnCqV7CfN4kSx9NxKw
	amw4XCaHTq54X6zjTSXWywYBR5a7Z26bozLnXZHHsJkgr1c5E1a7k2bD98GZKt+qkeipJI4vsgfwA
	wcJre/eosAaewtRo12paDu4Gjl4f65uu3KiEGhmVxbQiPvle/mpKmlznQFkh32xBGpaLHcd23flNK
	SLE2TRpYEWcETh+o14mxI5X9Zo2Ne0urIvVH4hZmBa5BNa6qsHcq3R8cNAxvH9mkugoMe8o2OF5J/
	3Q34+tV7WoabU5C/5ung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbOF-00000008EPI-2mk3;
	Wed, 18 Nov 2026 08:51:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbOE-00000008EP1-0xaY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:51:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0279A407C1;
	Wed, 18 Nov 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=90.182.112.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794991897;
	b=vNvVpTiaouaEomfxG8EqDitdaimjQB3dQWS2DAxeUTEC4RQw2rsktXTrQBAZpWJpFx0L
	 pKpQNtcNO+EtmARhuNhyDo4NiYmpQAADZXwPJKMkdZ6lRFadgXgLrV6DimA0sWdFRMHvA
	 /3uIBnDJBcG6MnZ5YKYzhhDh5W3KCUkg653mgtyYG95b6RFxnlw218FivOUWliWO/3eEn
	 MUHarjq8rdkwQARpD9s/SKpORQEtzhzvbqIrMPC3x7ZwjU8+VGBLMLy8pGvBS1BmvWhu4
	 MbxSqdNPzbwFaqAT8JT442PUw+kraUtD5Py25udQsnwKVY9t0obIPT8aGsXJnAcrk0Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794991897;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=OYNOuehFr9NKTiBYghlfnXrv0u5UnoGpuXJ7k9IkVak=;
	b=JGF6FP1qD0nKEBGBbXEZuq7cscDUGy5sEufrx5/4qv5QxblLj6OAwnZbn4DaZmCR98dq
	 Imxlk4HVOdMIMLfQPedWzyr+hhIERT9H27iol3+OFwT3OebNq9XCMCQDxSf4JjGynmxvJ
	 cy+2HPJzZDArRmsuC8MzGsrRPpv0dOep9ZopJPcfwlIr5XtcMwXtSFp9g8pn80dBDLDZW
	 4RPQVkGE4UBPGDEc82alEmLFd1zwGijB6Zqbaj3HXGaULZ1rym9dO8gIfKcPlvnw1D85S
	 mvvnRJhJ6Xntj1v/nxjnYSP4C+DQuADImJrTHL94dnip9QnvcnOjyR0MN/9gzGfiDng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=90.182.112.124
Received: from localhost (90-182-112-124.rcp.o2.cz [90.182.112.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id DD7D01F000C5;
	Wed, 18 Nov 2026 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991897;
	bh=OYNOuehFr9NKTiBYghlfnXrv0u5UnoGpuXJ7k9IkVak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ID6rWIt6dpA9/J1+Q/lGQ4/qxeKKdXsQJrLWR2Uyha/ClhyVqq6DSPiXw5OXNk3lx
	 h2Ah+ujXWRHnzMzwNwUXiAMfNPQwLoiajRTR+G/F2e5Qpf4jRkM1rVuWqySrivAjyr
	 SOHI9naAhqr61MCXF1s8KNPDJ3kCAjfacFbW1t9rD2xw8IFVreV7ATFWCoIMDaRMgs
	 OaEJw7D3mbwWMrlWpLUVZPvYGzqyx4TZu9KS0agKuxE7Y3i5qkUrHCZafQjD9GOBat
	 8OeOfg4NazDo3nJN9CJuiocQEz+iLfVAAsXL05aFOBhbPHaZHq6AtN7k0u4ZyLS1w1
	 4hj+O2M4CFtDA==
Date: Wed, 18 Nov 2026 09:51:26 +0100
From: Joshua Crofts <crofts@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v5 02/16] iio: adc: xilinx-xadc: Fix coding style issues
Message-ID: <20261118095126.00004f1e@kernel.org>
In-Reply-To: <20261110050201.1850399-3-dileepkumar.nagavarapu@amd.com>
References: <20261110050201.1850399-1-dileepkumar.nagavarapu@amd.com>
	<20261110050201.1850399-3-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 10:31:47 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Address checkpatch.pl warnings in the XADC driver:
> - function prototypes/definitions split across lines that now
>   fit within the line length limit
> - Realign remaining multi-line statements to the opening parenthesis
> - Add a missing space around a binary operator
> - Fix pointer/const spacing ("*const" vs "* const")
> - Adjust blank lines around a few statements
> - Reorder the local declarations (size_t n and void *data) in
>   xadc_update_scan_mode(), the only token-order change
>   (not a checkpatch warning)
> 
> No functional changes intended.
> 
> Co-developed-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> Signed-off-by: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
> ---

An exhausting review :)

Reviewed-by: Joshua Crofts <crofts@kernel.org>

-- 
Kind regards,
Joshua Crofts

