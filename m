Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B3606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HYkidMqF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+jvgTNP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/YPy7EtqEBxvhYpVJg5255qtXW8TP8P3A9Yp5QpHQrs=; b=HYkidMqFIPsYG8
	2MyjiYDj+QiriUvgbW+G1XwSwY33K9hqhi5oFD/cackGbwSh/4URBKU5pO7B4WvdJoNJ0hMaT9kLw
	yOxSTq5/OwXcNFFzhT2hl8jf1zE3kQShpFE1PC9ohRCKnebk/g+avpVWBj41y6S6lIHW9pY5p7qJM
	g4iphbhneC+zw041QWrfcN6FIdcCKOb/tpjOFR84eIDLK/udxGreP/c23YAICPZlg85AE0+jTkUB0
	tv8Jl6SxwiyTBfbmyHXT1mJGp8MFFepcVBv754NO1DqHNx0CsrVuqECsYFRpl3ePWVd3+Ik5LVZVc
	KIoRI2WT73bJPc20ZV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRY4-0000000DiGQ-01z7;
	Fri, 06 Nov 2026 21:32:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRY2-0000000DiG7-3xxj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 21:32:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAFDD60052;
	Fri,  6 Nov 2026 21:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF701F008A2;
	Fri,  6 Nov 2026 21:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794000753;
	bh=/YPy7EtqEBxvhYpVJg5255qtXW8TP8P3A9Yp5QpHQrs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=M+jvgTNPcTZJQwyGpIVg7LORfd80qPqCvwfmv00IFSDKglKybrFh2Q86T49BHN6Pw
	 eepnOm9XDnJOzR8jyW4GTgSo3lEYeFxB9nyTtrxOzgnmJKLhHV6XyzmT63kw1ebYRN
	 wWN0aMRfaBm50as9/t8q/UshKEYybFS4atrCAPh/OE6njzaTzKco5O3n+uLjx1FjKw
	 YSWHS/0jaTGRZncGCfuR/mMc6TL1e3ki/tezwZCUMBkNKHOZLXPQSiMk53E+L133A5
	 lelRsVAlGY0qCqMy6TP2FFzfu7SwBSWYiLOsC+xEazaQxO4IjRGdBNRgz80tthFnb0
	 OL6Gpn+UFGlqg==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, 
 Amir Ayupov <aaupov@fb.com>, Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com>
Subject: Re: [PATCH v3 00/14] perf cs-etm: Fix bogus branch samples on
 exceptions
Message-Id: <179400075194.23155.10383549774960029763.b4-ty@b4>
Date: Fri, 06 Nov 2026 13:32:31 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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

On Fri, 30 Oct 2026 15:13:07 +0000, Leo Yan wrote:
> CoreSight currently models exception entry by changing the preceding
> instruction range into a taken branch. This can give an IRQ the source
> PC of an instruction that already retired and overwrite a real branch
> immediately before the exception.
> 
> For an untaken B.LS followed by an IRQ, perf script currently reports:
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards
Namhyung



