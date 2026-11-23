Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44415606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lgHoaIOP;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BM8WZz0C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZhoRZJWv5WDLgSJ4NW+wzm1D4iqQUFLyqGAdX1OGoBc=; b=lgHoaIOPWFnMQb
	vcLBgZ1UYhgtIiIhXK+mDbduGfih+hE1dRGcjAuf1tQ3vJyvvjjlTGSeoeNcbkKOs+X8OhoiHFc+H
	Dp+ejCn4FqLM5e2JFXnKeOFSUuERl56q9QdMxdAW1cUMIUIUiP1YVCr+w7DyGr6oi3fvgxFHjbyDR
	/m39nB/62r4MG9ZOLj/8jUlflmBSP5wz2lIxRBDZVh+PDjOXPQ+muSi/lS//k/I+1sGO96THkVwU2
	aYRdx/tt2sqSmMPz5BPIVhq252L3aDLH1wDmUkb3fILq+qNUwIoL6n0cgIfKZCHrZRQk+HD96cYM4
	g5Bppqei3FrBj2n2yL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZm2-00000004ftS-3jIM;
	Mon, 23 Nov 2026 19:32:22 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZlv-00000004fsE-43tW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:32:21 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1765404a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462335; x=1796067135;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZhoRZJWv5WDLgSJ4NW+wzm1D4iqQUFLyqGAdX1OGoBc=;
        b=i8KfzTveWKCEjAeNUjSPS3OlPGAoIt+r4vD+qrgebPAoQ6WEIWftVfjmOnrI9Z3OzT
         G3E2AKLQrGGRrfYdTURJ8spcnb/8/zw0ism2BTqNuvfYCSujeIRcyCEHqVaclB5cUiht
         53GN52ExmYJTMECE73GIZ3Nlknp/RpZ6XqKof3itVniC1rTJp1U0DcIOcPp3E4E+qtri
         CVWF5T20jw07i5rwPNbTRADDij+PghD3ZjO2rk47Zzd7+DjZHaJh1yzakW/Hx13mFynn
         QmOt2U0uLGSg6lx4EHwL7AZUwxnGsnlH5yDhBBVoCgkMOBjegQGm5tBKRdtMrTBCxF2I
         vDsg==
X-Forwarded-Encrypted: i=1; AL+hErHztvYNz04z7LuFwXFvgfdaUsh00OUPUUVcGj5trcpDO7JSB/+j/jH9MSCmJ7LjA7kQ3cGndg0GnZ+hDTbiWTcD@lists.infradead.org
X-Gm-Message-State: APuU4Z8QG5GtOsQCwT0+6VKlOxKPZkCEweGQnxjvCRFs50KPyEDYZEHt
	S/LKVAvCXsmCE5eQTrncE91/gL94q6SRAHFIKnihEJbhHstQ1jedVedgD93s13HYsTCnsjcsY6T
	+gNaYncWIjytI0Yzsq3twJXsEIutjcluoLCb77tjt8yFno24qXVW6bGwGH1dDpNU2WGIf/VqPss
	ZX3aTisWQOwXfSsBnefHPawrtxVdwmUNfCEGU2p7uOKHq0mHpRfhbxfCOUHO6veiRG2sXpU5Iz4
	3GwOh04XOz9PIrf+l2YHD0NBAbDOevk4n4=
X-Gm-Gg: AZFdTZfRPp95+S8GCC0W9+P9Ok8Zk4sUv3tNwZ/YcbZRnKST94xSoU/NpDXyJ2yyB7R
	XsY4Sh6XZPD4+jtm78n6DxNcRbJGGUuTdiAE/C1s1okgXUjsFPBQ3fkj7f2FYGeye7v0lAE2kV3
	PDOQlhnDZfXd//qtUD7UYt3rMxT2Namc7fDppndoTWYHEH8K0bRmsfR8WfpoK9tqxeN3y7+SLVG
	wDQDbMwxspWwVlMMom7RfAtA/FlDRAMxXJqiOaEsgXp3zdfJbDLUpCUbX6KFWNuNiGimmnDcQQT
	l/DMQCjT606L+S7l4MevAhAdtBlsng1jopvCoDZsvlC0G7CWFPP4cMUZ19mYHwrwZWMoY3xWgSg
	h+M4ArMsk8ZPZyZfK85LQBEvK95VfR7wz3exrLBOSmMUoVDfMmwZG4SzW0SvXC37s2uYutZ7qMa
	dzl1f6zOoUe/Q06yTul7VJj1YndHDKSJW5uq1m66962lE=
X-Received: by 2002:a17:90b:4d86:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3b41c93cdbdmr7655693a91.29.1795462334943;
        Mon, 23 Nov 2026 11:32:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42001764esm3165038a91.4.2026.11.23.11.32.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:32:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso4711065eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795462332; x=1796067132; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZhoRZJWv5WDLgSJ4NW+wzm1D4iqQUFLyqGAdX1OGoBc=;
        b=BM8WZz0Cfd8uOgKwJJs6Oy4qB4DiYkPkZ3m6Fvb1V0tuDYaAkv0j83ArOefknlSWTy
         Z2N4ANL9ci1muP3DrGf67yq3pmej0AIIv82JP3S69zA4F13G2JsT2Ght2UOj2fToqHsR
         J/3/wF+FJ2nvKfZ/QbczgTLczxNwaiEsDFNTw=
X-Forwarded-Encrypted: i=1; AL+hErEmT+qAu1M4hShZDFTh59EFz2zZ4Aby8H8ZHzPpRVPy7Ps+ad2F9QLrlnoVAysfTcg210SEHyXZG8eb5CLVPIY+@lists.infradead.org
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr12630850c88.5.1795462331700;
        Mon, 23 Nov 2026 11:32:11 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr12630821c88.5.1795462330903;
        Mon, 23 Nov 2026 11:32:10 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm42340205c88.14.2026.11.23.11.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:32:10 -0800 (PST)
Message-ID: <60b6bd4a-c508-44e2-ae22-3f8bcc594457@broadcom.com>
Date: Mon, 23 Nov 2026 11:31:49 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] mmc: sdhci-brcmstb: Handle absent optional
 sdio_freq clock in probe
To: Lee Jones <lee@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ulf Hansson <ulfh@kernel.org>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261123191703.179283-1-lee@kernel.org>
 <20261123191703.179283-14-lee@kernel.org>
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
In-Reply-To: <20261123191703.179283-14-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113216_063326_9B0005C9 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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



On 11/23/2026 11:15 AM, Lee Jones wrote:
> Standard MMC Device Tree nodes may specify "clock-frequency" on SoCs
> that do not provide the optional 72116B0 "sdio_freq" clock, in which
> case devm_clk_get_optional() legitimately returns NULL.  However,
> sdhci_brcmstb_probe() only checks IS_ERR(base_clk): when base_clk is
> NULL, clk_get_rate(base_clk) evaluates to 0 and overwrites
> SDHCI_CLOCK_V3_BASE_MASK in host->caps with 0 MHz while leaving
> priv->base_freq_hz non-zero for system resume.
> 
> Check IS_ERR_OR_NULL(base_clk) and clear priv->base_freq_hz on the
> fallback path before jumping to add_host.
> 
> Fixes: 97904a59855c ("mmc: sdhci-brcmstb: Add ability to increase max clock rate for 72116b0")
> Closes: https://sashiko.dev/#/bug/linux-88799a75-1ece-4f9d-bdab-eeb713627ab2
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Not sure this deserves a Fixes: tag.
-- 
Florian


