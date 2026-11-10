Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB6606A22A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dz00ArNP;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUTjlzop
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cwTPehP0J/3J+Lb62G7yQ4FlvXwx6KiiQuir6lkIwb4=; b=dz00ArNPEwOd91
	m5iEaR6ng5C2F+uDeSWCbpKL8hzj1BlTdsqpLMLRbaouK+sPY4E5Q80g7P5ebtaJxzi3M+clIrEdO
	XaF16kl+XNu9fD8DBM1pfzhl5TYdzQLdaFOsMjHhVH23LPjcgeuHWo2u01PEw15joOeGOLltasu9m
	9hqjZ8lEjL7jWHpkr4uhY6zfQmdHvmw2FS3uB/1vz0EqDEAtH5CPMKfpmAD9Ws+U+f/v5gkrE1Qaw
	GInY9qxkQsWq4IHheLD2Ego3FUn6T8OXHcduFF7kQnBpk0MLvQUonR2KjFgrmPtdgFKk0gJ/Yoa4e
	S0gqM+8hxyl2PirvopQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQovf-00000004a35-051e;
	Tue, 10 Nov 2026 16:42:39 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQovc-00000004a2g-1UXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794328957; x=1825864957;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ri0LQs7oxDDyfXBO67wcYZxb4TvsJ82811I+HyQ0eUA=;
  b=NUTjlzopsHdtNjm9sL5HKIVYcbxSRG1hO8j1sIxad2vRk4BXewi+vNmE
   06tzCqaz8UholZVX0gSdVTErw2F9Bwx8vMliS5kGhvwyJc1FPUMbH+j3a
   9l0z+wVqg9iuphOudJBJ1bNQt91Fa3htEL9dNbSUoqmrSk1izLanVqxZ3
   k8JGF6hcWauesJJA7iOjome2qMTd7TVZeup+8AmX0vzYefVy1lAoP8Gcr
   eeYMNDLKt9K1BLhMuXnSzb2e8EdFTrVeGTvGavLVe0WWu26PPsh5R6Dr/
   ECjCBEy3oFvW2s9cGckHfQGtx29+QrE8pFYilqxuNR0KG3+QycDTa30Zl
   A==;
X-CSE-ConnectionGUID: QEQVrztJSjuPblCEpHMKww==
X-CSE-MsgGUID: V2JZRk7rSViQ1r03AQUKwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2960361"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2960361"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:42:36 -0800
X-CSE-ConnectionGUID: uZASnqyqToWTIzEAEQatrA==
X-CSE-MsgGUID: 0bpe4HZuSYm/ys1Z1/CWyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="10068575"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.246.17.60]) ([10.246.17.60])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 08:42:33 -0800
Message-ID: <599f1b31-f175-47df-b074-1915688eb390@linux.intel.com>
Date: Tue, 10 Nov 2026 17:42:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com, Andrew Lunn <andrew@lunn.ch>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
 <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fff90721f7892c0285f4fed7fed460c7c1e183cb.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084236_458390_BED3FC03 
X-CRM114-Status: GOOD (  19.04  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026 6:53 AM, Andrew Jeffery wrote:
> On Mon, 2026-11-09 at 18:41 +0100, Dawid Glazik wrote:
>> AVCRP is an Intel x86 server platform equipped with an ASPEED
>> AST2600 BMC. The BMC is used for out-of-band management, platform
>> monitoring, and system control.
> 
> It's probably my fault to some degree for not providing a better
> explanation of what I was after on v4, and for merging changes from
> others in the past that were pretty lax on the description, but what I
> was hoping for was something more like e.g:
> 
> - f28674fab34f ("ARM: dts: aspeed: Add NVIDIA MSX4 HPM"), or
> - bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
> 
> Are there more details you can provide? If there are, I'm fine if you
> reply here with them, and if there are no further concerns I can update
> the commit message while applying the patches.
> 
> This also applies to the JNCRP patch that follows.
> 
> Andrew

Hi Andrew,

Thanks, that helps. I also found one more issue in v5 (uart-routing 
issue), so I'll send a v6 with the fuller descriptions below
instead of having you edit them. Please hold off applying v5.

AVCRP is an Intel x86 server platform. The BMC is an ASPEED 
AST2600-based RunBMC module on the platform's DC-SCM. It supports the 
platform's out-of-band management and exposes board management I/O such 
as the system UARTs, status LEDs and control buttons, while integrating 
with the host's telemetry and management infrastructure.

JNCRP is an Intel x86 server platform managed by an ASPEED AST2600 BMC.
The BMC is the platform management controller for the host system and 
supports platform power and reset control, while participating in 
out-of-band monitoring and reporting for host faults during bring-up and 
normal operation.

Does this shape work for you?

Best regards,
Dawid

