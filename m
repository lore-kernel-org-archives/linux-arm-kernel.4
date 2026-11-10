Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01487606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=It/WvWaB;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EhDhquzJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jp+oM3z+TGlK20rj9Ru+iQ+Q6Mz3+Gb1zIaLcFJ+NLI=; b=It/WvWaBiQeoXm
	Ee2wQdJmMoH7wNk17lBw0lwGRTWTcKrO/qFV6HeeQAneoej9kwtpg3BRxm1iiVSXTwMwUoTtnSnvd
	LE5t9+ujI4zj6ILcCJILSUr1QPftr+WD/oV5ib8PhhqLk1m2DW3GX5WZ4t57wt1OhIeTkCHfP3WA8
	nyfCVwuWls08Mw38UkkGahK9mUqHRUIZCqY/wekA6RtKIx85R3Yk0qtl3ak5KNK6f9vLqMFFHyMRl
	7Zqds8UmKbgR78fO5dVWtwVKEZA68uQ+SV22kSutywFHe4OQ62bxaRxePjui7msOo34ndsxyajuut
	4GjpgCwGtdUSHCXmWAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpw3-00000004iLq-31ZV;
	Tue, 10 Nov 2026 17:47:07 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpw0-00000004iKz-0hnE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 17:47:06 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso997429a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332823; x=1794937623;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jp+oM3z+TGlK20rj9Ru+iQ+Q6Mz3+Gb1zIaLcFJ+NLI=;
        b=rTMTQX0d6T8MAuZtm23BqOxxsiEtff/8Mve0TwrK1w3wScv9FwKYN29pD6FloWVjRW
         Y1xohqvGyCBt9YrXYD/EVSU1e+z+XSNx56UMjp8w2bGscNf/R8mrAaVljlUrpgAra8Le
         foZ3BOyJZCLXvuNHmOBMsiuRWlBexhnzPnEDyYQIEtpBkIa9HObghjUcOhoRPNxJkG5w
         aasH5vyE5RZuYZ7UkjFSFhGQANs5Mz5aBvOCPVI6ESSWkI1uCmPDxb+g53U0Ds+NcU+z
         OprUgsWi2UYJ+pfeUpShay/EcRUIs2jI9G+vwsH+CUz/PD2+jn8xPCZRREPFfW7qUZ/5
         7GRA==
X-Forwarded-Encrypted: i=1; AL+hErE59/hI1KrR9Ggy7GQfUkodKHLb2J7B0o9XxwtciHKFP3qMIarX/9icbFtWs37FJiIMiS99vrpxxhJCufaquRmn@lists.infradead.org
X-Gm-Message-State: APuU4Z+BCXBL9nIqcBWRW9f0E36rfFdEj5LO/Hy8HecgYX1d4Aa8432F
	fe0015/P4M4c7R8vufObqqMKcgMA/4I6s6+Rjvz2fiPDx3ucjdOPoVFMPfJfNEHKH+U3J6RrDWG
	IZidQLZLgQkDQPyNhx+OQDiHNgwUFU43wdF4JyTkxi53hurRw9naw0Og/jjpp7zqrn65c6Khuj2
	FqGrv8oZW1krD9ScwtUq7ctweCyfiswMeTdXRVbjDUmh3nXjwiWPf2l2hPpPZqY4OYHZqMJm6S9
	SvCnBKCtGw3UidxoDssmV9Y13WlU9cPNk8=
X-Gm-Gg: AYBFou0geTi0J1s6iGgL6rsuqCfBbDiuMj7LW6/xZXlxOhEKxcaZmyNn9UFStLdtjoS
	XfIBOzTdADL0LrdNhz/ORa04p5cQxRfqqQ6QMi42bxnabyDpFHP0btNdfpzSMoiIBEazh5gjQDn
	fvpNPmgc+xJIxK3XEyVlc2gR1P11W41C/Lx+ufFmpvQKgD91FpJusvojEl1cLsBupi6hLNVoJlb
	t/lzSMtZh4Z943qohOtjueDZ7/fGleNeo7YdIJQ+hans/jaGgjY2+XOBSiReC+LV3Zp5w8LWb5f
	NHiAitya1TGmB2wUjSoOa6pBLysGMgny3jNKV83JcSQP1et8lrS84fu644vHKNUIkKmWpgPxsa1
	T5uKbEMRz/qAyHagAX5xsCS5yupyUKK6y+bjsSrcUtY+qIhyYyyvG14zXOqmDnIDkJraUw9irpM
	nvSipgyTHa2rAoT2ziRcFlR8azB360sJuv+GCdCu1X
X-Received: by 2002:a17:90b:4f41:b0:3b0:9941:8d41 with SMTP id 98e67ed59e1d1-3b166caf083mr3434538a91.28.1794332823084;
        Tue, 10 Nov 2026 09:47:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181c01fc2sm14091a91.2.2026.11.10.09.47.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:47:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1478066a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794332821; x=1794937621; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jp+oM3z+TGlK20rj9Ru+iQ+Q6Mz3+Gb1zIaLcFJ+NLI=;
        b=EhDhquzJxCBX8TXIg24QInibhaReB7iNiW/y1fdnk6Jtcj8X4ZO4H5Ks0yrrjUC+C5
         KiHqU7v0gGLdWSTJCV9tedeOqW/zzwEYdHCDYaxyLQv7EW7QKLa0wdJSSLGPid4EuY25
         oRKfwcskTei3pquHBiv8DcuHsGG+pwFcGqCpc=
X-Forwarded-Encrypted: i=1; AL+hErFWJV/XrriQd1J024SulwCTlagT29jdaxCkTNGJiMxn01JXfggJHcl1THGMmQsOV/MctlKU9GURUWDjsliFCJSN@lists.infradead.org
X-Received: by 2002:a17:90b:2ec3:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b166cd1576mr3597626a91.43.1794332820891;
        Tue, 10 Nov 2026 09:47:00 -0800 (PST)
X-Received: by 2002:a17:90b:2ec3:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b166cd1576mr3597607a91.43.1794332820425;
        Tue, 10 Nov 2026 09:47:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e203f8esm531433a91.14.2026.11.10.09.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:46:59 -0800 (PST)
Message-ID: <79f827d9-8aec-49b4-bc70-117de314206e@broadcom.com>
Date: Tue, 10 Nov 2026 09:46:55 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds access
 in fsel_get()
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Bell <jonathan@raspberrypi.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_094704_241991_65D3B426 
X-CRM114-Status: GOOD (  24.01  )
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

On 11/5/26 23:06, Wang Xiaolei wrote:
> brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
> register and uses it directly as an index into
> pc->pin_funcs[pin].funcs[]:
> 
>          fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
>          func = pc->pin_funcs[pin].funcs[fsel];
> 
> That is not how the register field is encoded. The setter,
> brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
> funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
> always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based function
> number, while funcs[] is a 0-based array of eight entries.
> 
> Every readback is consequently shifted by one slot, and a field value of
> 8 -- which the setter accepts, being the eighth and last alternate
> function -- indexes funcs[8], one element past the end of the array.
> 
> This is reachable from userspace without supplying any invalid input:
> 
>          # echo "gpio45 alt8" > .../pinmux-select
>          # cat .../pins
> 
> The write is an ordinary mux request that fsel_set() accepts; the read
> that follows goes through pinctrl_pins_show() ->
> brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
> Raspberry Pi 5:
> 
>          BUG: KASAN: global-out-of-bounds in brcmstb_pctl_pin_dbg_show
>          Read of size 1 at addr ffffa07c577ab2e8 by task cat/839
>          The buggy address belongs to the variable:
>           __compound_literal.62+0x8/0x40
> 
> A field value of 0 has the same root cause in a milder form: it is
> reported as funcs[0] instead of GPIO. The mux itself is programmed
> correctly in both cases, so this affects the debugfs readback and KASAN
> rather than the hardware configuration.
> 
> Handle 0 and out-of-range values explicitly, and index funcs[] with
> fsel - 1, so that the getter uses the same numbering as the setter and
> the index can no longer go past funcs[n_funcs - 1]. The existing
> fallback for func__ placeholder entries is kept:
> 
>          if (!fsel)
>                  return pc->func_gpio;
> 
>          if (fsel > pc->pin_funcs[pin].n_funcs) {
>                  dev_warn(pc->dev,
> 			 "invalid fsel %d for pin %u\n", fsel, pin);
>                  return pc->func_gpio;
>          }
> 
>          func = pc->pin_funcs[pin].funcs[fsel - 1];
> 
> Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
> "gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
> the splat above. After the fix the same sequence reports
> "function spi_m" with no warning and no splat, and a register field
> value of 0 reports "gpio". The register is restored to 0 afterwards.
> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

