Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B59F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KYtSJd6Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6tp+EBmTmCafv0bXfTXAGlP4RtQ5np8bvAvgsUxK4SU=; b=KYtSJd6ZZSzJAD
	E1kIuUP2cKVo60ZTZqRW9FvE7+Xq6G8HD1vzVMPfqdPDGllmth6cgfwJOi6dgh38NCyCzxiwg3beO
	/C67nErwm6W6vUfyqF33MpFIcyerfitYCTrlgrQehyPBNVNsmHJ4coiFGAhGuuVGqG3qO6hRI3E9y
	yZUArXTxSaVEIUSBuJkyJTLHh5wmvY3lhTOwGVHqot9qRXNPwz0gYoBQcZS4aZamGdD/hDIN9F1Ai
	TupFglywQGNEKlaPIDADmL8X6i3xEmrIKESEh2XANbk4MXox6dtUyYU0ggJvWl2+ppE62tEnknnSZ
	YycQ6eQA+E/kiJm4Qsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7TF-0000000D9pi-11Hg;
	Thu, 19 Nov 2026 19:06:57 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7TD-0000000D9pG-12e9;
	Thu, 19 Nov 2026 19:06:55 +0000
Message-ID: <2b83a226-4736-4b54-a35f-840cee4ae0cf@infradead.org>
Date: Thu, 19 Nov 2026 11:06:54 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: arm64: Fix RST formatting in booting.rst
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown
 <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
 <20261119-poe_booting_rst-v1-1-bbae0ab68498@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261119-poe_booting_rst-v1-1-bbae0ab68498@arm.com>
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/26 10:02 AM, Kevin Brodsky wrote:
> Inconsistent indentation and missing blank lines in booting.rst
> generate unintended blockquotes and nesting under earlier entries.
> 
> Fix the lists indentation (use 2 spaces everywhere) and add missing
> empty lines. Also make sure all feature introductions are standalone
> paragraphs, and remove excess indentation from the flags field table
> (which also generated a blockquote).
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  Documentation/arch/arm64/booting.rst | 148 ++++++++++++++++++-----------------
>  1 file changed, 75 insertions(+), 73 deletions(-)

Much needed cleanup - looks much better now. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

