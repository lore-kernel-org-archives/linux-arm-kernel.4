Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B648606A8B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hq7fOgHF;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=L3PO2f7O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=095gff5RrzV1e1Koloful5YvrXAFYrDfx4hD6Rgp3qs=; b=Hq7fOgHFZaGSFE
	NUJ7z9jwHAofFyNVWc/NIdZ7+vMsJPOhPg1KAO5thY4OlbWiiayxC/41YafqriclYBUvU51ZPpNsb
	o5xDa94aoW8Ev+YyekDuLEBUJ4Vd80o/HflUzvWULu7KbwdRu9+7vqYHd1c8h3V++cI+j0CCHF8qT
	mpxYJZCEtQ6Tat9H9/shQtL6xEDPBr3icExJy11+v31pntgh6565bx+9dbDVougzeRAM6m4RKErZR
	gP/BGjmpEmUULPvu+8/KoraluJaaUgmlB91fC3fi1t69V10QCfa0nU0nthiXM5RcOjhaMaaYLHgbR
	opbYaF2Iy3IO2qVcBpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4KL-0000000FEfU-0xoY;
	Sat, 14 Nov 2026 03:21:17 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4KI-0000000FEej-3eFb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:21:16 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1357426a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626474; x=1795231274;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=095gff5RrzV1e1Koloful5YvrXAFYrDfx4hD6Rgp3qs=;
        b=BglMy9dSWBv8vDcMB+/1QQmrrrFw9GnDF2bWjTuJJA4N1h+ljmx0ZCzLRoVzyjKZhS
         YxpZc2i0ZCxbdFHdpkmvSbAL8YnX2DIEKXQdNmDLSK0cUaNEQtouN+T/c3oBRTVUpy+g
         0JsU5TTX3OuLfB1mlMJKmwPj94XjwiDlCCtZzKVM+n0ZTqX+jwfbiYPzrbpB8f6WcF9D
         qhfufe6Sf7UzS/YEI7YhO01QEM3gx6WLzSrfKbEdfJahSphTczrjEq12jtBBz2YUssvL
         C3lygWsKef1Ec1hy8hZd6e4yXBDXTLo+QBogEvg2BUAF3bOXAKdSqw7kNOpW1n1zTsfc
         inFw==
X-Forwarded-Encrypted: i=1; AL+hErGzwpM4az+n9SGEFTuas7aqm3/zDY6K2ED1ARA6RwF+8yGVKwYxqkn/YwPjS03R+m2jRKgSwusVObHWsaLWtXUD@lists.infradead.org
X-Gm-Message-State: APuU4Z+uCRBmf1aI362jiT5zcF1lQhg7hl9QuaHZAMWAgOdThG31Hcr7
	xYfdSu6O3pOiWZtaUqz+rE3S/LNII18RJmvgMuIvybnycgkPh+pUKWUzVC/IeBge2CUepZexF+/
	L5eAiPAau+aYV2AszvB/OWJW1jABvbggntRg2tJojWEMYpezBjyOo8vO1ImdGNzScYiWZdbTcUu
	CmNE1thDONtBM9WN7m211b7T2NZVAUUJnRrQ1i0umKwpTHxS6mOwMGr6NjjjX3bjkKvXqJPAFnZ
	fFRjTfPyoLBUpfHl/XHSKsjLjf0Ubif9eU=
X-Gm-Gg: AYBFou0sGe8A+SqCrnMt3Vk5Ojie5UDtH03E7abN9oYnRyrejriRxctBkhXcgwgwCHG
	EqIiEDLF0kS369Zm11blvm0NZdRjA98hrkqyWjn/ondsfzlR1Ni/LzUB4+DgNYr1DTx/aoupyiJ
	pUD/1JRkONRSvCU60nVfkSeWqyb9I8q8gEkz31pNf6kJG+kwcy5A8wWqx4S/bLn440hEZK8a+Cn
	z2BZrUgHfuVxJVHHwiZ276G/v+xxONkFXDxYbd7n6I7jj1exzSpQdwsLt69QpwKlwV6WQhjDsbe
	W8OO+lgL0d+cjv4WLqm6QgtKWthJuU9kEvaKJ+tc0C5WxCC8uh2+lvpJGnkWWuCMYcjDxWFCdsH
	cxg+z1P0LVuWOzP3CGCgbzt7zyLHbQbaeGgT7BHLR5HtatIT1OQCly3yMPtf8XDuGcH2d7vqO00
	2tdw5QSx68sC4f0js9RnHVXHNoHm9j5XdedkTv/IsuTgI=
X-Received: by 2002:a17:90b:4a45:b0:3b0:92be:ea4a with SMTP id 98e67ed59e1d1-3b1b0b5f3edmr3899512a91.45.1794626473919;
        Fri, 13 Nov 2026 19:21:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c1352d3csm1240261a91.4.2026.11.13.19.21.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:21:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1298730c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626471; x=1795231271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=095gff5RrzV1e1Koloful5YvrXAFYrDfx4hD6Rgp3qs=;
        b=L3PO2f7OxfzVqIYkMFfUDFpElhbvMH4tuWKIKLhlVvc8uMxLjS9Y0KkJL3TAoVObIn
         rL6L7RvbQamq1sW9+okpEYw3mOQr13NQ9RPiI0FybTelNp4qG9YzX+DPEyujdKd+INtF
         WA10dyTtALEal7T0EN/gBSXF745dUVi0Ty2eE=
X-Forwarded-Encrypted: i=1; AL+hErF9yV3CcsEYKyRvax9LMUAojXEfNT2degTKqEVHq7shqGvPk7jbJWjwNUuqbaJfC5KcA+AEqc6YFJH8kP2eUjsG@lists.infradead.org
X-Received: by 2002:a05:7022:f519:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b50317545bmr4251763c88.24.1794626471003;
        Fri, 13 Nov 2026 19:21:11 -0800 (PST)
X-Received: by 2002:a05:7022:f519:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b50317545bmr4251713c88.24.1794626470290;
        Fri, 13 Nov 2026 19:21:10 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm17687180eec.18.2026.11.13.19.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:21:09 -0800 (PST)
Message-ID: <01568cee-cd7b-466b-8546-ff45f3a69056@broadcom.com>
Date: Fri, 13 Nov 2026 19:21:07 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] firmware: raspberrypi: Style cleanups and fix
 child device lifetime
To: Sander Speetjens <sander.speetjens@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
Content-Language: en-US
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
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192114_907692_E6794481 
X-CRM114-Status: GOOD (  16.95  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/7/2026 10:21 AM, Sander Speetjens wrote:
> This series does minor style cleanups in the Raspberry Pi firmware
> driver and fixes the lifetime handling of the hwmon and clock child
> devices.
> 
> The first five patches address checkpatch warnings (missing blank lines
> after declarations, incorrect indentation, unnecessary braces, and
> undocumented memory barriers).
> 
> The final patch moves the hwmon and clock platform device pointers from
> globals into struct rpi_firmware.  This pairs their lifetime with the
> parent device and prevents leaks or incorrect unregistration if the
> driver is probed more than once.  It also checks the return value of
> platform_device_register_data() so that an error pointer is never
> stored.  Registration failures are not propagated because the child
> devices are optional.
> 
> ---
> Changes in v2:
> - Move platform device pointers to rpi firmware struct
> - Link to v1: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com
> 
> ---
> Sander Speetjens (6):
>        firmware: raspberrypi: Add blank line after declaration in response_callback
>        firmware: raspberrypi: Fix indentation of return statement
>        firmware: raspberrypi: Add blank line after declaration in probe error path
>        firmware: raspberrypi: Remove unnecessary braces in transaction helper
>        firmware: raspberrypi: Document memory barriers in property list path
>        firmware: raspberrypi: Store child devices in struct rpi_firmware
> 
>   drivers/firmware/raspberrypi.c | 61 ++++++++++++++++++++++++++----------------
>   1 file changed, 38 insertions(+), 23 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Discard those messages about patches being applied, I see there is a v3 
which I will be taking instead.
-- 
Florian


