Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E943606A890
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q6GoryTa;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y3ECxk1X;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lh87NrjJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fkaip4qS14ylqt9Rs2BIygOmzT+9Aj/KKz7KnKpQBFI=; b=q6GoryTaQFezfKmApKQgIipxMB
	FdOIiTkAuDu/LyRankOh2xZkmdgZJqf5IT87uDAJPVfRyd0RCkQUCuoOU3RP+I9FomJwV5h38WrCW
	O7fyMIgHGLOO7LAQhIte2K3zuDvUi1MewB++WVqzlx0COG2RtvEY+jd52z+N6gFWCuEnipGKDl/QU
	AtCrJ8nd8omJl7RoDXRU3RH7cQRJkAB6Ho5vVTFm414y72gMfmJXOSM7VZmf8oZMopk0F9N3+GH1L
	Mjq+7Dwu1pjcNY3g02yUVeVRifQfMhsnRljS0hXbUqgP7aNl632FMKxKV432MYQ/xZ9reoeu5FcAx
	/g4VJ+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStsA-00000001x0i-0Ro9;
	Mon, 16 Nov 2026 10:23:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSts7-00000001wzj-3Kr2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:23:36 +0000
Date: Mon, 16 Nov 2026 11:23:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794824612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkaip4qS14ylqt9Rs2BIygOmzT+9Aj/KKz7KnKpQBFI=;
	b=Y3ECxk1X0lq2PhiIOrgb5SeiDxNyMSKFDPbrm8MoNGCUez1qQcDXzbQAEz2yIS6+Ds7/MU
	flFSYoRRn4Puqvjvy8Cpu/4dQxUpvhbJESOfOGI1wAio/Fg2OFoA//DFq9cC/p0jU5e+dA
	jSIgizVmlEqlL2Qg1nuz2JnwWEnN2dvU3MNn835XSqtnH4ZZK+nw8Qzd93kHY8NfF6ljQy
	ztD2NCb0DA/UQYzuNqKMOahr4R1PsataEYElrS6YnIh1N9HF98khKkCwA4ksycZpT53j6X
	TtkS8uxkkTymJn+Us4IOh6g/0DjEotAezGczG4MbngbMoe96+Z6BsqJfSctLUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794824612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fkaip4qS14ylqt9Rs2BIygOmzT+9Aj/KKz7KnKpQBFI=;
	b=lh87NrjJ//Joe7OcB/t175TNDdjSwJpL1xTn7bJKTPko0Wc/RduqOIc/UERvkPBE4kH06f
	vw+qaamOybnJI/Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 00/10] mailbox: imx: Use threaded handler to avoid
 kworker in imx's remoteproc
Message-ID: <20261116102331.K8Sc86V9@linutronix.de>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <avrLnVFtgobyTwN1@francesco-nb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avrLnVFtgobyTwN1@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_022335_976561_EFD598C3 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-16 10:23:41 [+0100], Francesco Dolcini wrote:
> Hello Sebastian, Peng
Hi,

> Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8QXP
> and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
> still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
> MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.
> 
> 5d1c0000.mailbox interrupt count before the test went from ~8k on v6.18
> to 60k+ on v7.3/v7.4.
> 
> Peng: any idea/suggestion? Does it makes any sense to you?

Can you pin point it to a patch in this series? My guess is that
something with the masking/ unmasking went wrong. The increase might be
result of the interrupt keeping firing while the threaded interrupt did
not have a chance to run.

> Francesco

Sebastian

