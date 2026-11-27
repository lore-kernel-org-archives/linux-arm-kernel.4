Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6603D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TGKDAflN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b43+c8Cg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G8NnEquHh6JPrt5WKM/35q0o6NTyLXSxP+cYgYnFdys=; b=TGKDAflNijCDHO
	8R3TJw2pVqrz8Ew9ed2Nr8mc32DTdy8FxhxXLV1Zg1eRFf19YTWPQ2i38TiaxtK1s78ZxigRZtfp0
	OnOf6+qWr43Txyc26ux5GnQJQpAIrnbJnvmcGtwvwbZW4QvK/QxqGITYswcuhHC2D4WYcSLwnwP1n
	6at/j91ZGmVkYiCLtj7xgpJ83z7GkWsqfbhwd3p9TTNDBRkNgCPEKhWhZ1sJzoq+7ecU9lxj0TU04
	gXsuO+CYNlpOGzUeh2B9H/lCqj4UaUrEoGOJe2g6D5Ei+MPG0btUllcIFHFYrNmJvqQbx2MI3zxnA
	yEUpcYMJ7ZvpccQQZdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0oi-0000000HR0G-3HyB;
	Fri, 27 Nov 2026 18:37:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0oa-0000000HQxR-1vjX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:36:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5EAC1575;
	Fri, 27 Nov 2026 10:36:52 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6D623F86C;
	Fri, 27 Nov 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795804615; bh=6ifu5kHm5pa1d98fpL6HG21zQD2uf+dZa/ElH6oL+Po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b43+c8Cg4WzasHC2UHK7/jdi18rQBwVZBc/LIiJEKn5ZFBSfL2YVSHmum9dYopHpX
	 8OWP0Rbke/ucNh6SaIdyrIob3sYstfEZM9D3p0mCkQ6rySMpwS42Nm/47wYzESNUpd
	 ZwDmP+375fMIpueHrm7xRx9WdUlVnu4x5+fy59Hs=
Message-ID: <5cde8317-61c0-4405-915f-44fcc3c54389@arm.com>
Date: Fri, 27 Nov 2026 18:36:49 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Cristian Filipescu <filipescu.cristian@gmail.com>,
 Norman Herms <dockseed@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
 <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
 <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
 <20261127-a733-dt-v6-04-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261127-a733-dt-v6-04-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_103656_626951_7CEE50BF 
X-CRM114-Status: GOOD (  11.61  )
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

Hi Enzo,

thanks for taking care and making the changes!

On 11/27/26 19:07, Enzo Adriano wrote:
>> Ah, indeed, good catch.
> 
> Thanks. v7 uses <&reg_bldo1> for vcc-pk-supply, with a note in the
> patch.

Yes, thanks.

> On a different point: shall v7 rename osc32k-clk to clock-osc32k, as on
> the A7S and A7Z? The schema still accepts the old name (deprecated), and
> CHECK_DTBS is clean.

Yes, it would be great if you could change that, too.

> Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
> on 2/5 [1] and your reply [2].

With no vqmmc, and vmmc pointing to a 3.3V regulator, I think it doesn't 
matter, no one would negotiate 1.8V anyway. And we didn't use that 
property before. I am not even sure it is correct for the A733, since 
the host controller DOES support 1.8V, it's just not "wired up" yet.
So unless someone screams, please leave it out (and feel free to do the 
same on the A7S). Eventually we will need to drop that property anyway.

Cheers,
Andre

> 
> [1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
> [2]
> https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com
> 
> Enzo


