Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61BB6079D41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2ry2XYzr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EtLaUQI+;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YknvdGy6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YGC1j/tEUBspAeOyZe85YoNU5P50/8WXh7ecwgFwlL8=; b=2ry2XYzrmQkqZ/
	UpctkxHvW/5U4NUMeqyltFzH6Vjol43c1GkkMt4wZE0FL4lOOZoqmHKGTrZQCtX4kUFAOcT809Lj3
	cf5I2LQBrTUlzI7OYRh4V41a3L2aN3CBQdeN+h/JY2reEy3M8CcGXXGaUwhobP95Y8I/XSvue06Fv
	RGrFTRWd7K3i5I7ytE/yqyDLsGv6iDe5qzTktTT/cN5d7BpskZJYAcWR7uT1+I73kD+6YdSP/ZUf0
	iyZsBiPPuPt0rkRGXTbk95nLRIrcRopgOqSZwRHlZiaRkwvf/70pmYAHSUPmJ8w7o6PEMbaWNHf5F
	utFQB1YocnMgDDB0imTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvOB-0000000Dn4C-18vD;
	Fri, 13 Nov 2026 17:48:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvO7-0000000Dn27-1SA3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 17:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YGC1j/tEUBspAeOyZe85YoNU5P50/8WXh7ecwgFwlL8=; b=EtLaUQI+1MRtQhX2LjtPZRmh0T
	iQCkiYHxezqYk8Wi8z5KNilcGDhVx39aw4ZZ/R82NFxVL6A9iPdPJUVHz4KgmiLQMuC68g0GWKCqA
	U6/GPXV7TiK0qzTf0meuBe8YTTUFf0NsOtl/fPAU8XWrz/X2YSCGDWFkYRSKFXk0VhyEXYAlyeqhA
	An4yaka5/fz61ZoKjcxRwF9SGD2Msp7W7JGq6bsuFOa2fLE5dNHVZAYmVw3tGsz8Xthbynf0L4OmF
	NA30GP13pTS91zib3M7pz38yYa/nFnpiEDFpup35hgO0zThllvOl+TKjWNVKN3k5j8VjGTF6LD8kX
	Nl83AEvg==;
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvO4-0000000Bc1K-2Rdn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:48:34 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso653673a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592110; x=1795196910;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YGC1j/tEUBspAeOyZe85YoNU5P50/8WXh7ecwgFwlL8=;
        b=X2Ugb9b7BdBFRm6t+Sd1lKuBc2i9yPbMxEg3+38fnlJ8SUHHiuoUNRb6aUcELqmbMq
         EQy8Bhq3ETlBFV9bFCtEt+3VBTLnoo6og2artqlmTst9YTCWV/+h4zadxBXwsv24kAgE
         5x9nJ/PxoZHafKlYsa3jlcNuJVNXJsuQWS+6npgCHvmZWpFn1kFHgYiPArXxWkkmxTc6
         EjFkmnuXSpG8Gi72mTgFS9pd/+TLH6T+0OGqLTYxys691xSp+cLp7dX2SgQ1en/OrQSD
         HANEx3f1+juMRnKXB0jqR29tTas/YE9KBntgJQJhahfx8FbhwUgpWmJcreV6XCQquUkf
         ZFrA==
X-Forwarded-Encrypted: i=1; AL+hErG0D3w168a2z2aAbP3ptTXLGrGX8e17y77ArVZH8iNgqv0Z2VpdmA/BNQNxsZgP7t8hXG2u6p7Mm4zqnCk8OkCU@lists.infradead.org
X-Gm-Message-State: APuU4Z91Sngy8OKFLsp+YJE7YaYc/RNqo8oLZ9N0fxYoDY3aXVCSfp8E
	oBMtYyRRnFMhy+vuqMnt0lnewGmApxYDlE0NqCEvwKzjZ2XtGiMsdsSjhGsrAmIhuCl4uuMHbra
	jIj6Wsgz+IwSJDtAq3/IY07JArxoAr1PIw4ZEAjKR+/426E8gTchkFtNUCsZgaoBuBTr62EV+l0
	PCOSbvzpQCBQFOx+DdUHCVLRq8kMsBKEVMRpSkM4I0vwU6Gh5U7xdVwfdZiu/M/v8NTg2u8XH8K
	SqpBzXHFXVr3DAYa0BmcvsVVInuH/JupiE=
X-Gm-Gg: AYBFou2lZJTiUGdxorSZtE0tl9p/yzM0XXKFd1yq7N04/WxdPSRMLLyUR2my/MD46+4
	h2R3A/ERHwGv9UwAbmbvLVPnGenXqzvmLstO+3PKuYtzI+Ed/x+4W4ATZ39ZRQ781Zi28z7Ki5w
	QTredfafuY3s6vZKIFGSaEIwY2PFTRsqXmZk/3bnMlNTF/pMrsSVblpTXP2GoW8H1IUNw+j0WtD
	KxOipyYNNWCZd1HpO+hOCXuSGKPkvj0/vyPXRGHBc+AuJu8sc02nWA/CqxfsfArbJ5acXfjjK4g
	TYxmG9jqLlB4zDQep4gi4gi4rfjAnje/wPWdyjKV0bqeeIksPVsrFJ9UaVauquX98y+yqtRswxK
	Fq1A1h0/m5vxywonwUtfGqPTq29G9JOmF5eXMJU8HWBJxwm2hFkrZlcR1uiciEWBGTyXwRXa6JX
	XLLE9tPFckHqQUzKxa+kUO22EGzBnumIOE3JtC5w0m
X-Received: by 2002:a17:90b:5483:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b1b087e1c4mr1896967a91.5.1794592109649;
        Fri, 13 Nov 2026 09:48:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3c0a5a8sm2058477a91.2.2026.11.13.09.48.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:48:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb061cc4dbso1422099a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794592107; x=1795196907; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGC1j/tEUBspAeOyZe85YoNU5P50/8WXh7ecwgFwlL8=;
        b=YknvdGy6bNKNul6lZpAAZ24KQSlOeOF8sKXH5at8q3OroYlUlwXgLOOmDhwxomTDb5
         bsS237v7RJfgQbaOHR62DsGolgV3NSg3zAal///Ayz5qlLyl/+DgJ2Jj8391cX5gfpmL
         MKIF+lcGs/qk142q3tDrKGCzdQdBgnFkkuSiA=
X-Forwarded-Encrypted: i=1; AL+hErFqcFWrsbzkm2WxfntZ9RaYtJ4tE68kwjs+D97L56EyA2kLOKyuhb9sZ1Fi+5yGPWA8e3j4H/0kLiTCUOmPT8xt@lists.infradead.org
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr1916507a91.14.1794592107329;
        Fri, 13 Nov 2026 09:48:27 -0800 (PST)
X-Received: by 2002:a17:90b:4c8f:b0:3ad:7f4d:2839 with SMTP id 98e67ed59e1d1-3b1b0b5c3cfmr1916489a91.14.1794592106835;
        Fri, 13 Nov 2026 09:48:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b245f0c3sm2462591a91.0.2026.11.13.09.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:48:25 -0800 (PST)
Message-ID: <16f82416-ea85-4eda-bfae-4047f414135c@broadcom.com>
Date: Fri, 13 Nov 2026 09:48:22 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/12] nvmem: Add the Raspberry Pi OTP driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>, Srinivas Kandagatla <srini@kernel.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
 <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>
 <avauNsYkHqIAshCe@monoceros>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <avauNsYkHqIAshCe@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_174832_550660_610B3B30 
X-CRM114-Status: GOOD (  17.03  )
X-Spam-Score: -0.2 (/)
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

On 11/12/26 22:34, Uwe Kleine-König wrote:
> Hello
> 
> [dropped Ray Jui and Scott Branden from Cc: as their addresses don't
> seem to exist any more]

Their emails are still valid, they just moved to 
first.lastname@broadcom.com, reminds me I need to send Jiri's patch 
correcting that.

> 
> On Wed, Nov 11, 2026 at 08:23:27AM +0100, Gregor Herburger wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> Don't include <linux/mod_devicetable.h> as that introduces a lot of
> unneeded build dependencies. <linux/platform_device.h> is sufficient to
> get of_device_id, so you can just drop <linux/mod_devicetable.h>.
> 
>> [...]
>> +static struct platform_driver raspberrypi_otp_driver = {
>> +	.probe	= rpi_otp_probe,
>> +	.driver = {
>> +		.name	= "raspberrypi-otp",
>> +	},
>> +	.id_table = raspberrypi_otp_id,
>> +};
> 
> Inconsistent use of spacing before =. If you ask me everything other than
> a single space gets inconsistent over time, so I recommend sticking to
> that.
> 
> Best regards
> Uwe


-- 
Florian

