Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80BB606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wYKtiNsm;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=h2u2l/wr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=; b=wYKtiNsmWI3mBYbB8VNgJqIZJp
	T7VvpJJ3TOWrbu5t/CLH6bbNacmt62WPGYhFZBkZAbIE5pujTvOs2SFlwoIQjHlkHdzlXv0+CmFb4
	jMAr/z8RUD4wvkl03wPT1ocpnGAg+BGnOgshgoheKsYtbhHflb9d7rnambV+eL89MZ86gcTuYKG2I
	ln5FyBaMWdQck4GIzckhKELwhLtjjCbehSJhtbyEvmGRb+MJ+SMm2y2d+VgQBKXmrlbeoBd7IxIFq
	JUOpPeVMuILjHQUeR+jQQApfSMccDaLJcowhEmrOkzDsqtVxbNtHdQqCUXCgopQHngbzzLAJ8jiM1
	k97V5/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0j5-00000003R2f-1Xho;
	Mon, 16 Nov 2026 17:42:43 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0j3-00000003R1r-285u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:42:42 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-91c6ce60697so77022026d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794850960; x=1795455760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=h2u2l/wribgnLB30ebN82/I56qr94dVGPaFR7ipH8XuSNTw0KB35P8PHAzncsBR03O
         jqNqj+QkZ6Yo/ozTtdff4wnltWUymFKiZTd+NE1UhVOtIwaJXLY9ArF7q2cGqLfokidn
         xyiKeIiq/Msqiv5REC4e35RDdZAo1Si1ezE6O8hDr1sxwqJhaQ6W2O2iuJncXHvjCE/x
         v5E7DsBIJCZLpHD6Roeooz3hd5HOYm7HBz7E7ZSS0ybZSWuNhvj23PR5Re+5sKqkmjA6
         JzlmxzeNqSSqXd2TtmgrfyIYiery4QpnDWKgrb87JbgI6Tcw4H4Wr8+1u9QJHzlfkJr8
         cvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850960; x=1795455760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=TeUq27dKauYEypaoRLUE3O463uIss+2CWqiQeWBUs/Gudu6bwzHIn7z0RoeuwA60d5
         e0mGnYmgOhU7q3BpEI+rKUFBcSTn94LWhF+nmafNCphWPGQ96BLBbSgZ0zIQwFQqSpHm
         L97+l10QAFemuzcBwrqrV/kaDIBN7sjZfP9inG9j1Nii9Z+DYLrrx3vN4BLxzgYUA0jf
         H8cmS7KFrMzpd+Sn/zE67Fcts7RXG6ncbZpAMoL7kMBINjL0pnU/89ruXlWstCWpJwMI
         DUNOdpf9f/rw/jKse249HIhsBf355rKcgX5Qvg11PTEPmWOO1cmUfNMMJV7eMZ03gy19
         BlEg==
X-Forwarded-Encrypted: i=1; AL+hErGvU/qKA3BaMIUItSWQRxtBD7rutcvVko3s4Xw8Ddu0M9LcvQFGwT7Q+/y9GV4yEBm/10pzwpXu6O1hixCDbe2Z@lists.infradead.org
X-Gm-Message-State: APuU4Z/uO3ngo3w5N4gcFmApA7+eROzTCUNNnAsOPzdwmhLsKJ16c6ia
	7VAwpr8tZyMy2yA+PeiUOs4rw3+VbdLYEBrWr45hfnlfrzD7Duu/IZYz/0ms8VPEWDw=
X-Gm-Gg: AZFdTZdzJ6ZBQTv/kch59jVn5vBOngTPGApy9LlGAYVoysOnWi5DSwZa+vCfRtZ5nds
	IG0/AW/QYd7ygF7aG47wc4mwkJyV/ilA+NqPc5lNwnY0GDYaC78cQxMd69YHZKAQQlsOt/b/h+V
	XgVecTgt/TsWJOgZZNBUlh24awZmr4CZcK3+0rBEjJ3NF8CBMAgfwt5r5x4+i6LOadZ36/ky5tu
	KyOy3dbLzx24bp8hEr4PBBKOMDZTmF9p8nPa/PLzZPOeLuFh45iQZmz8Sq3S6oXljq3utAwp/9K
	RsocvsyPjkOulv+BoemXRZRTCkXQ7ZFZ1SKsg0MbWCiLZi7DfjWqVkJsu2zQrdlFww3vvxROUTg
	UkmwGuZgropvddR1MIggfY7/rDsSMO1ykux97uuRxAUZZGnzd9TO1w3NDzUdou56QsNtUXZxVgN
	qdM7duDX2ftg/hix+NiWQE4TnLZBxkspfJ8YARecpfwSCzewRlNdwm1rRNqvnewRAJ9Pjk1X2Gc
	ifOoy53smhSBHjOPZf9CN0mP8o5ARqg2opk1dah6wLrXimyxk3+vdfs4+GfpetnUbh3oT6L0FFM
	/e72kg==
X-Received: by 2002:a05:6214:4698:b0:91f:1004:2ba4 with SMTP id 6a1803df08f44-91f2400b38fmr177678706d6.2.1794850960144;
        Mon, 16 Nov 2026 09:42:40 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm91150276d6.25.2026.11.16.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:42:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT0j0-0000000A2D3-2QWe;
	Mon, 16 Nov 2026 13:42:38 -0400
Date: Mon, 16 Nov 2026 13:42:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line
 parameter
Message-ID: <20261116174238.GC2299285@ziepe.ca>
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_094241_584564_5D42A269 
X-CRM114-Status: GOOD (  10.54  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:

> Instead, I propose handling this in the generic IOMMU core via a
> kernel command-line parameter. This makes it available uniformly
> across both Device Tree and ACPI systems and across all IOMMU drivers.

Something like this could be useful, but also Leon's series will allow
userspace to do it from the initrd too. IDK if that is more/less
interesting to Android.

>  static unsigned int iommu_def_domain_type __read_mostly;
>  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
>  static u32 iommu_cmd_line __read_mostly;
> +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;

We can allocate memory at this point.. No need for a fixed array.

Jason

