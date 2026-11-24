Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD39606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWyLyHqM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UDdLoFoN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=whpdiooOdtf0fQpB9RYBhngBI1Ig6SjjoowNuFUHFpk=; b=OWyLyHqM2d9S2/
	hLUcoRPzRnvlnqjljw3ub0iXTSZzFUUpa5oZI8MsgjHUEzwGduBmzckWSbwMiUm8q6B0SFSYqMtUQ
	MdaeWw7SvPFCkbzEdo/L6Lj4TDoAhzO7Dmkb1/jI/0ChA1g4ZbV4ArTWo7eqddKCNBdHoNMhZmKH6
	1EiPPhW7BSovK5bZCMyCwlOUgR5CECDabJD/QHxEf5xU43vtydiiaqTQx6lAc0XHgeOmUFg6zSMY+
	Rnju9Yly83+SqyQ0hUE+wONIF8R41dtD93Y8VK5mie8/psZZp5mrCa3j7mp6eHT2y9thcvRnBmQ/O
	Q314+giF9iCVvjnrlCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrjQ-00000006n9U-2e8a;
	Tue, 24 Nov 2026 14:42:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrjN-00000006n8W-2ouo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 14:42:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB703339;
	Tue, 24 Nov 2026 06:42:43 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B19953F86C;
	Tue, 24 Nov 2026 06:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795531366; bh=HSwH1G2ztI4XVuIpxGm5jCaIGdOBrcPPn6I/LiR0ErE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDdLoFoNOCRh4wx8Dt+N0YAX48rS5yofCSHP4YgowGgAqupRoB1XUFyiOgWSAXjsv
	 R9Ll5zo15TJAAAsFh8bp2IPsU6g5wRm60IFIFHPh/w9efiojqahBFW30REqhMEKzVw
	 xry7Tl9F7uRVevJe2tDZJ9cBuK4Joj+DAPL5HUjM=
Message-ID: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
Date: Tue, 24 Nov 2026 15:42:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
 <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261121-a733-dt-v4-1-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_064249_838515_F846FBDC 
X-CRM114-Status: GOOD (  16.82  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/23/26 18:42, Enzo Adriano wrote:
>> Can you please add the A7A and name as well? I will send the .dts
>> patch shortly, but having the name ready would reduce the churn and
>> avoid conflicts.
> 
> I added "radxa,cubie-a7a", "allwinner,sun60i-a733". Both strings

Many thanks! I just see that I messed up my sentence above, as I wanted 
to have the Cubie A7Z added as well, to reduce the churn and stupid 
conflicts between series.
If you respin, can you please add this one as well?

> are in Radxa's Linux 5.15 Cubie A7A board DTS.

Please note that copying from a BSP is typically not a good idea (though 
fine in this case). The devicetree as (somewhat) published by Allwinner 
is quite non-standard, to put it nicely. There are large conceptual 
differences even, so it's not just about naming or such. You can use 
their DT to figure out how peripherals are connected, or to learn about 
some IP in general, but it's not a good template to copy from for 
mainlining.
I would always look at other DTs in the mainline repo for reference.

> Please let me know if
> your DTS uses a different compatible.

Why would it do this? It's the very same SoC ;-)
But yes, "radxa,cubie-a7a", "allwinner,sun60i-a733" is the right string 
list. And just replace a7a with a7z for the other board, if you add this.

Thanks,
Andre.

P.S. I would like to post my A7A DT patch, with the hope that you could 
include that in your next post, shall you update your series again? So 
could you wait with a potential v6 post until I got that one tested and 
posted? Then you could ideally also include Vinicius' A7Z patch, so that 
we have all in one series, and just need to deal with the dependencies once.

> https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
> 
> Enzo


