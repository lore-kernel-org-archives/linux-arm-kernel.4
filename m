Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE662606A229
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pvPQA9vB;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=S5qRHdE1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=; b=pvPQA9vBqFYNpY
	LjudBhcqiyFIosHTk7md3Q2nOOh0zYZaLKJuiulkabUxk6RbZzpw5oN0TjThkk15BZbwFUxfq+RK3
	+ku5r6RtRwyxqlTbi9eqDtrBoji0P5CSChs+U+HfNHJYqyvOhITNFWvjhgX9uRP6Rjl9uGEhN54hF
	pPjiP1+wcw1pYl9q0XVbYslKU+9RSOUgGsGWDV0SnXtxZ52RJsMnpjrLG4QQ6lwmlrzfXevlExr4s
	oLcUisqhJHOcBoq5F56iu4xJP+9Taly70EnYTGrSjZJGTEPUg6HOrUTOqNMfms8uwwsraK1GmkBRE
	dVnb51yjnG4IjzriODbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpxk-00000004ibK-0FWf;
	Tue, 10 Nov 2026 17:48:52 +0000
Received: from mail-pg1-x561.google.com ([2607:f8b0:4864:20::561])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpxh-00000004ia5-04AB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 17:48:51 +0000
Received: by mail-pg1-x561.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so928082a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332928; x=1794937728;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
        b=VTPsE8MB1R3sInvp/86kEQIPeHqUSv20vO5vwaGh12W2CLVh7QYLjZLoZ+0b9TDRGo
         wcuQz3rRo836a5XVuqlBBdg5pqg1kzNNejoX2JFMpRfFnPT0JGd20BKZlAZAGPhUx8RH
         1NmzwYJJVm2ye2fPp6YL/pnt1bNIlEva0e5SMISHz0asjy3UrAauAzAATShZHtL7E98J
         KxhtMcchVPT35gSD3+FQbCYAukLsyBg+qd5jQsp+VdEcHkmuL2olU5eBUC4aVO5qrHLZ
         XM5VzdeXIx3d9OCjst5Dq/i3aADqa9dtSYyUb8QJaU7hQ4ysj6RRDvVbItrg9ngpkWg4
         VH3A==
X-Forwarded-Encrypted: i=1; AL+hErHtBidmotOTBsuB0PJ9zCAU1OUiNMSrmVSFZwJBvthPcxeyAVEcRNu/ac05NPq0Dj5OVI7iXlpkMKenIrWzm3vU@lists.infradead.org
X-Gm-Message-State: APuU4Z+h+rb2Aj2uAZLKg4ev3445v2+kipd2TGbdt64AwrWNwSp15Lp9
	Nc0NAFKCzqmTyACn05oWqY3hb6uM0yQd0Yyz2k3q3rl0HvXZvH4PNXdvm6MJQRftmxukqR+ecHA
	X8qjsYRG7rZSG/YY7ddOQc8+V+rc6M/ZqUAgHpB9uHLIs7DemKRBX7ILLTY4csq34UAVPCX3rA5
	hUNhyQ1QMuQ0lirmssaH7t9dam37YqO3rHnXFSKQmqSCL7CzN3HC/apEmN/08YNIQw0AFYoziHx
	dtgoSVrvaO/M9Yq31KPCxc4/Ro6m+Zb2zQ=
X-Gm-Gg: AYBFou30Fg/S2rlA0B7pg3I9viARlKEvUp9BLzWnQUpSYpKr/Gjz+RhcpLyb3HXCFme
	TgMKCaWV3u3epE/QGZMyiN8ASSxVr/b3Cwn3BFvjVz0nrpmzbBxMUtQTR4FBqb7Y5jAXRjqGWxT
	zHGezYmcj7rSpgRqkNB7Zyn37xIMRPsh2nockgYqs0hg8TmiKGvqkBHmWm4guUtg+rNF4ndEuDd
	yyw1QVCMHErYIMLQbrXw2M1Pty+M6bDpUzAoNQZ00XruqLhJFgzJ5zZqORfrCPS8LxoWYuNcKjT
	wNg6n5sl3O2WmoI30TwZ8xMN/dNB8g87BfCTKCydfKGbI7+HzP041woJdzXwL8zjyIvUEL4MfTt
	kEN8cVW5A6k0oUuXF2AcAjHzPSffghW8iwSiezvfJGnMsNkBHNSLdweKswR9UPfRwfAFYfgs0IP
	ts4cS3b++yGKc6BM1UGJoOYkwa+jJ1fWjdS0hULLgb
X-Received: by 2002:a17:90a:d44e:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3b166cd48a2mr3016716a91.20.1794332927792;
        Tue, 10 Nov 2026 09:48:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17da4b50dsm306000a91.1.2026.11.10.09.48.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:48:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so2134016a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794332926; x=1794937726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
        b=S5qRHdE1unHczoALYYu0EtlbTN5DOURWDR3PxYjE0p48hjveDPPWUp4MaBzurhrqhV
         2nKd7+hGQ5I0XvdNGVKQvNAoJnLVbcq7RvQDp2Htm4+HYGum0WWY0VK1a3cOGcVsFSp8
         Gvh99lH3nW5clZNWddIiHtg1xSnckQEuJZ7rs=
X-Forwarded-Encrypted: i=1; AL+hErE5c2pMLMIhWzGt1DMvfFRoNwlbmYJ1Z+VbjKLUxpDjDaW9zLbtXJ1veiCUbqUOrhxm/Qwh8OzvHljm4jUytGi6@lists.infradead.org
X-Received: by 2002:a17:90b:1fc6:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b166d03802mr3219204a91.40.1794332925872;
        Tue, 10 Nov 2026 09:48:45 -0800 (PST)
X-Received: by 2002:a17:90b:1fc6:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b166d03802mr3219189a91.40.1794332925425;
        Tue, 10 Nov 2026 09:48:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d550dsm566282a91.8.2026.11.10.09.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:48:44 -0800 (PST)
Message-ID: <f24e21f1-3bd8-4682-8393-ec6aa6c1b232@broadcom.com>
Date: Tue, 10 Nov 2026 09:48:43 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 bcm2835
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_094849_067301_0E4A71D7 
X-CRM114-Status: GOOD (  10.52  )
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
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> handles both CONFIGS_PIN and CONFIGS_GROUP map types.
> 
> The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

I think this deserves a Fixes: tag because it fixes a memory leak, 
generic allocation can allocate PIN_MAP_TYPE_CONFIGS_GROUP, but the 
custom callback does not free that allocation type:

Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl 
binding")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

