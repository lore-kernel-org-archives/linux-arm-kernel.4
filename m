Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CAE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=okehpOMe;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DBEhjyIZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Db+YXabgIqjCii4/wDF/p9jfXt7DJt7000EJyfPCLPM=; b=okehpOMet8GfKQ
	AN1FGqO1psrBMg7l+5cWMIdKaudSqIGrk4sVtraynsgiQbpk7OsG/HRl8BGVcbdckfSDmDZYONUCD
	x2rnmv6PwJHwgWCVtundmeDTtkqe0S9L+GIsLv4wrYuzWDHJSC7/Bgg/XddSqT3dnEJSEwP/B335+
	r1tK7invRIqCzYEWpwpuuLkoKLUOU33CYlr2gUndsHFTozajZUOyKIx+qUHQnLrHe5zI+6GAYjTHe
	8Sn1Axxv0Q4JiYwurtdRtvna5n9m7M7c9gpFzFRmEILqWPiWGO+a4F8ZQPRTnYVY7nqsYDYiEZT1g
	UA67WbOQ9NTBlwW/xbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAep-00000009WGA-0d80;
	Wed, 25 Nov 2026 10:55:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAel-00000009WET-04TU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:55:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC29D339;
	Wed, 25 Nov 2026 02:55:14 -0800 (PST)
Received: from [10.0.154.42] (e121487-lin.cambridge.arm.com [10.0.154.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B9273FA32;
	Wed, 25 Nov 2026 02:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795604117; bh=Db+YXabgIqjCii4/wDF/p9jfXt7DJt7000EJyfPCLPM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DBEhjyIZmLlKPRRVE5g0CwamcwBfj9YwCJRJ+vLawUZqZNqPtFikMTXZ0+Az2qNn6
	 YG0cwOisNF55A5gc5nTLrR7a0W3BB3nfp7S3gwXsMV/y6HOsNj+BPdN7Qlt/ZYqS3k
	 WjF8wBMWvPh4NkUBbLIWXZBRPWwMfra0+oe99Ym8=
Message-ID: <b76773b4-bea5-418a-937a-72679c98ad75@arm.com>
Date: Wed, 25 Nov 2026 10:55:14 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at
 boot
To: Brad Hawthorne <brad@sim.vu>, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org
Cc: linusw@kernel.org, arnd@arndb.de, envzhu@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261125025852.1160075-1-brad@sim.vu>
 <20261125025852.1160075-3-brad@sim.vu>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261125025852.1160075-3-brad@sim.vu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_025519_405397_995BC315 
X-CRM114-Status: UNSURE (   7.30  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 02:58, Brad Hawthorne wrote:
> so a kernel started by a pico-sdk loader inherits it. On the RP2350,
> the PSRAM where the kernel runs is not covered by the global monitor,
> so every STREX there fails, and the kernel's atomics, which loop until
> STREX succeeds, never finish. The kernel never reaches its console.

This suggests that boot loader is the place for handling such platform
implementation detail, so why boot loader cannot do that?

Cheers
Vladimir

