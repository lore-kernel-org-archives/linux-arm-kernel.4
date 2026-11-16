Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE5606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MmSEJ1ie;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rsw5+En3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fawrS/3ssONFT5J61BoyKpRzvTv/DunyIOYxlv8HJm0=; b=MmSEJ1ie+D7vWZC7eF2Q50pdkC
	L3yR5RcSG89+vBNqPS1EwIMSmwPpBxQtdCqoYZdNEzLSiEYDyhDFJHs3dt8Ut3EhSTFq6cTTUy9ml
	GtKvx4u7ebuupUVMQEExznUAQVMH1XRpQgTuPTdjiKVnx9VDri8b8UAIdy2InwJcCwXEKHELT5PNl
	vcNgX+3zjEFDm9kBpV3RXxpnD2A7WMm+DQrrdmfYzP02XC02RnepigyDzeAWhqV7bO92vIhoAO9+c
	8BqbqOL6L3GR0+ICxIjZqdavmOyj6gYnWPOnMqOnDhOqvdS1VsofxbRL/5siClZJyJbwuN21eMy7Y
	EeWwSvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvBW-00000002EQc-3afA;
	Mon, 16 Nov 2026 11:47:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvBV-00000002EQN-3ewA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:47:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FC8441376;
	Mon, 16 Nov 2026 11:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481051F000C4;
	Mon, 16 Nov 2026 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794829661;
	bh=fawrS/3ssONFT5J61BoyKpRzvTv/DunyIOYxlv8HJm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rsw5+En3+9wrQKzmbmtFGi8MVW112ImjuZZC4tc3VB0P6R4WR2aAo9XonN9s3vSG1
	 z+Mv61pulx2NsWwq879gwfSqoZjziMhEbwuoBO2py/jmxqCKJeY3JZ8Audt/3rP2ik
	 rK0R1RCSx/qUTBqZKJe2joy7y4L1rhXCcBE2g7o8Ql3SHNnb18NnIKL3hKcY96xexB
	 ne7KMyzfCTP9YWC4mOhtgvymbapz9NWR/Ea0/NP1FSgkGp8f+0+yCnNUfVYgWaGh3+
	 IBndu8EV0BA+sxc+KLKzA0xiIlzQdQZnO/bEKmEm9AGnBpAgvtVvRfECgM3P87xeZq
	 ukv0T+kV6tXHw==
Date: Mon, 16 Nov 2026 12:47:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Fu Chao-Ying <chao-ying.fu@globalfoundries.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: mips: mti,mips-cm: add performance
 counter interrupt
Message-ID: <20261116-inescapable-dangerous-hummingbird-0faed6@quoll>
References: <20261112-i6500-cm3-pmu-v2-0-cd2569571819@mobileye.com>
 <20261112-i6500-cm3-pmu-v2-4-cd2569571819@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-i6500-cm3-pmu-v2-4-cd2569571819@mobileye.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 02:29:01PM +0200, Vladimir Kondratiev wrote:
> The CM3 asserts so_cm_perf_cnt_int when one of its performance counters
> overflows. Whether that output is connected to an interrupt controller
> input is up to the SoC integrator, so describe it as an optional
> 'interrupts' property of the coherency-manager node. When absent, the
> counters have to be polled by software.
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


