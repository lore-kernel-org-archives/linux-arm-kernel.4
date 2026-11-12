Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C30E606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PSyPTTEr;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HKGBX3iG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=67XE+pOyTXrOxg14FNOW2nVR7sSqHYk9a1ZEpCs3068=; b=PSyPTTEr1eHV7L
	uwAP5RSpI5D6FuKE1qk91jx+ALLu0TVGrMjsYHQ/6DlLwB6ESdAc68+fwNeWSmPmzku2H02IGwgaX
	wAeWV2PrYDiDvvACvzApcFc+Nrpbfj0BgXJXpFSA25NZAsneSqXGkl5ocur7FImkKEl4+c9EsvJcd
	4F7/R0nfci3M5fNLJqxJLeZgsCROE94imXD6TgFuJGrSwuDHrGFxOTAHbKhIIIq9QU8x7KtfIlPNK
	qgoFWZVVqM2wKMDtMA/BhZE4W4HBFgk6T6merrs+IO2AVRwvG3/rW0aBmPRfkNQozIrLYHyXDaZaS
	0o8EFb5KiUOXgnLkcvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZFQ-0000000AqeC-3P7i;
	Thu, 12 Nov 2026 18:10:08 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZFK-0000000Aqcs-2uvW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:10:07 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so27540a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507001; x=1795111801;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=67XE+pOyTXrOxg14FNOW2nVR7sSqHYk9a1ZEpCs3068=;
        b=Q2zssY/at6lGtkUqQZgryx5ISG533aK2oRzN69zAHm376SXrTwcX0jEc9OEV2EsDNH
         jHFGQrJAS+906XSMSIWf0Nl+8+Ai61/xSRO0203GAO9xSECXoi0iFatHJOspcLLF2W1L
         0bo+8zmmeyPWWLNot2yIhfDMV+TGjvkNeCKJ9JG18eihstfXprGOKpY0Hhwpw831uIKP
         6jITQqOb0SvVqjMDFlzLH/vL7Lljywv8qhNMZoN3/wU1VeR6ad85ujo18AlnXAAp2ogn
         WZY8QASU0AIJOZLyGKBaB5HOORAJaMb3sdC9CDoGhQzxENXlKhopGK3tAptB0AuGNQ9Z
         R1CA==
X-Forwarded-Encrypted: i=1; AL+hErENlHADXDbJrBVvMkuWeQZC8trED2p4QU5P8toXkODrefi4TtVgi/cIwl3MXjp0MDDtd0j+s8w7Gy7HLM1VpZ+r@lists.infradead.org
X-Gm-Message-State: APuU4Z/gdWhacQ7dU31l3mAmVtpTSVMBQAStGgp0ONMLzEf+tjooQcyy
	lfmqIq8nbPWkghQj2jE8Sf4/YNMCzkvnkBKT05q3A/aId1tRpWpoxMVzibL+GXubcyC13SrvCkR
	vhtf7O/E7So8r5G/1FQu5sVvzIO57QMHfn/YiC8j69XpX0X7Tkl0vQ+7WDP7wzy/7dDIexaTcZh
	RZTtvgjtNafgxQLyVzKeb3hegH0wJCp7GOjzBnrPtmz2KK+/2cQlHjtRwGb9EVM3LXpT0n+t6v+
	TlbotwzqyXnrnd7NHc1WR5gJ8eV+PbjSzM=
X-Gm-Gg: AYBFou2uiBa+zeeSTKeMgy4vqZ1adgRG2ctUIDFzxhIJSN6rsarnYAAI/KBNOo+w5gF
	ugtYwsIJNZG16nVz7V/pElYrv2JP0FfkRQ3PwV9qB0Qn/nddMaz3DRhnANtHbZJmQjv1KvPS2ur
	OSkYRZUqA/l+wNchagyi45bpqTU1FRP8ZvF8CAyQUqNTHO4bK3pXgFIQbJGpnS8cmfdrY7CbpHV
	e9Olc9pIwGJy1iVCmImlFyzqG3OH6X3iXGKOvehQ2hTpQyax7dCP0WzJg+eoN/q9gIZL8dQfaHZ
	L4Le4RoSompVpc+M0koZb1gL3JiHJGIZlQlU9+FOVW6FFMquT3CXo4t77AQg5pHFYQo9YVLkyBC
	b6FBenMV4kRGyaML0sXd5O9R9aIdeTOsWZWTjzId9N0onfmY/VV7IFQe66tVwhVdhJPHvrL5EhS
	ydaRik58uAvO31Z4Owoj13DwBDD152CKJSKXNAeFTO
X-Received: by 2002:a17:90b:4b84:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3b182efb525mr6203436a91.18.1794507000731;
        Thu, 12 Nov 2026 10:10:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e80bsm413057a91.5.2026.11.12.10.10.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:10:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53639e47be2so90145281cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506999; x=1795111799; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67XE+pOyTXrOxg14FNOW2nVR7sSqHYk9a1ZEpCs3068=;
        b=HKGBX3iGfy4qoQIFjI5qIVK6ZQ8HsFyzkbb81kPAof7uGn4Vs0X8aIXDiulhRlUoHp
         jqcC/o5S8mdQV8zW8coz3YL0u5OzvinRkW6DhURYHFp9pUSix5WT0kP7vPllj+ZJ4yqm
         AWwL6EeuOpPWuvLliJBul98TB0MofxHPRwTAU=
X-Forwarded-Encrypted: i=1; AL+hErHduID1xGltJQYj0SCAJc+hpWJuqdRw3kdxn7mF/tGaqAbiFiNgNx+Fo9xUcqRf7diGIAglrM4B+WwXHNJvmtBy@lists.infradead.org
X-Received: by 2002:a05:622a:548:b0:535:cc6:659 with SMTP id d75a77b69052e-55ac8179497mr3218501cf.37.1794506999447;
        Thu, 12 Nov 2026 10:09:59 -0800 (PST)
X-Received: by 2002:a05:622a:548:b0:535:cc6:659 with SMTP id d75a77b69052e-55ac8179497mr3217971cf.37.1794506999020;
        Thu, 12 Nov 2026 10:09:59 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70489sm1470666d6.21.2026.11.12.10.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:09:58 -0800 (PST)
Message-ID: <22b7948d-096c-4f76-863c-70819a4f989a@broadcom.com>
Date: Thu, 12 Nov 2026 10:09:56 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/bcm2712-mip: Fix multi-MSI allocation for
 non-power-of-two counts
To: Nicolai Buchwitz <nb@tipi-net.de>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanimir Varbanov <svarbanov@suse.de>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20261112-bcm2712-mip-msi-align-v1-1-68090868c979@tipi-net.de>
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
In-Reply-To: <20261112-bcm2712-mip-msi-align-v1-1-68090868c979@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_101002_857604_FC1C84D9 
X-CRM114-Status: GOOD (  11.09  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 03:58, Nicolai Buchwitz wrote:
> ilog2() rounds down, so a request for three vectors reserves only two
> slots and the third can overlap another allocation. The alignment is
> also applied to the bitmap index and ignores the msi_offset that is
> added to the message data.
> 
> Reserve exactly the requested number of slots and align the start of
> the message data block to the vector count rounded up to a power of
> two.
> 
> Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

