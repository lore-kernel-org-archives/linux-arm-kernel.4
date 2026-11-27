Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC038606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JoH13n0K;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=POp6Ljo8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A68Fc43o/OGN2y9oSPSSDZxzULRR2g11UStqF9f/CJs=; b=JoH13n0K/lh/oE
	UNWxkIjftDmndO/2H0bk5/l6+0nywgu+A2bDbzuUkyAka8wMiAk8gY9FaTCuSbrSGuUQ4EGFlzm4W
	mFvVmQ7bBeFgPJWYsRo5OcSfvSN+oJPX4QfkUs35QWS4dM+3IYNK6uOdEiuu22KqeQU2+zvkrLGCx
	MuMFhOfOcoRYXOZVgJn6G3LHserbrrR9UXWDgByEzhyAj2QTMJYEBuyQCrqHn31yUw6HQu4RbmxcC
	rr4S2NUcHP6pn3/aWUZdN8Dyzk/e2FVN9G7uQtrmIwp+jdslXMYfgeJ6WAlGo/18e0RLS7IMAmt0m
	8OKYqUjSaBUtGTkgvtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuZ5-0000000Fut5-49mZ;
	Fri, 27 Nov 2026 11:56:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuZ3-0000000FurZ-1hZy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:56:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFFF11756;
	Fri, 27 Nov 2026 03:56:24 -0800 (PST)
Received: from [10.33.50.35] (e142021.arm.com [10.33.50.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4B3E3F632;
	Fri, 27 Nov 2026 03:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795780587; bh=Xs58qPOPag1jyxHKAgsrv/b8NJwtq1sPSFPfFX2lDeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=POp6Ljo8RAhx+OMn/hFpNNbPk3PjT0+ggeTztYGji34/ryVbRZarbEUAynH4+1G5R
	 a3rST72HMFa6ZQoEjqX3b3RSyAJ9sglyMEukcjkb0cPfanDrQ6r+OfC1DSNKcVuM1q
	 LDh6iqHLnvTvqCha5r0wgUazDC8WjUxYsCCz3jrs=
Message-ID: <4c9ea902-24fd-4065-82b7-41d6df43b082@arm.com>
Date: Fri, 27 Nov 2026 11:56:22 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
To: Jerome Brunet <jbrunet@baylibre.com>,
 Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
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
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <1jik1ild9n.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_035629_502577_81810D41 
X-CRM114-Status: UNSURE (   6.95  )
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

Hi Jerome,

On 11/27/26 12:33, Jerome Brunet wrote:
> On jeu. 26 nov. 2026 at 15:36, Enzo Adriano <enzo.adriano.code@gmail.com> wrote:
> 
>> +
>> +&pio {
>> +	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
>> +	vcc-pc-supply = <&reg_cldo5>;
>> +	vcc-pd-supply = <&reg_swout1>;
>> +	vcc-pe-supply = <&reg_bldo1>;
>> +	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
>> +	vcc-pg-supply = <&reg_aldo1>;
>> +	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
>> +	vcc-pj-supply = <&reg_swout1>;
>> +	vcc-pk-supply = <&reg_aldo1>;
> 
> K is bldo1 according to the schematics

Ah, indeed, good catch. The schematic is somewhat confusing in parts 
(VCC-PG for instance), but indeed the VCC-PK label is actually VCC-PK.

Thanks,
Andre.

> 
>> +};
>> +
>> +&r_i2c0 {
> 


