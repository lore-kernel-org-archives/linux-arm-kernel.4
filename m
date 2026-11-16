Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2075D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hrJ57rfS;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CHBafn44
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7JGRKYIhmwCYE3KPUYPJEdw6GaPbg8hbt4OXk4UERBc=; b=hrJ57rfSk8eRfV
	Vn52qphG+C4jYT8bQdAaMSE49+fZcFYXqTrPdGtjE9Uk7+UVLY/PEz7scaaukzBGhYBNr7cfxSuYO
	JfgEj+YbWoht4KJli8gpprqKIyFnlx8ygVxbPhs04kKnxwXEZlSBm9kemb9Jxtai0JR4WIFFlaX/Q
	0eqIpmqhwu21rnpDfio/9fAc+J4RISEb58huRGrL4432BvphhO3jKzLctLPvXy0iJ2oARPfLmE71i
	+zeO6DDzsknJIYkjsq0m+OZwgLZxvvAgkMwxLNq7X9OE+GAHNJvFmSyd80ut410/bjG89PeQzsE0a
	xLlUkvcbb593HJX/hz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5pH-0000000480o-2uSn;
	Mon, 16 Nov 2026 23:09:27 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5pD-000000047zd-48fg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 23:09:26 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2222888a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870563; x=1795475363;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7JGRKYIhmwCYE3KPUYPJEdw6GaPbg8hbt4OXk4UERBc=;
        b=ueLTJzgxWYSE5x1xSkeJaMB2VRTxz/4RKUgNavEOws59gj9Pl431XEwip/AzdUWTBA
         G9b+PQ/D55W5v6e/tcU6wKodoMbWmPjxCEfMU8qF0oGDYticdUx8hzgG+GmlqdpHM6yd
         YZ3VgZpoqsiOWTPQeJ2kNTKk+Vb/oGLLWhrHxzAOZbaaYgkAPvWTNpft6TCFFCiAGVpB
         KwJRD/q9FxoZE+jUdKg+z4lGCI56XQsYklltffzYfJIUMNt+T4V5ofOuOZep0rhNudfm
         45b7iTeGsvxUIdOdH8qks4HmWtq5NocxJdMXNWm8Ee0rKNpAMSDFJcxZXEZ9CcnoUCQP
         Ud9Q==
X-Forwarded-Encrypted: i=1; AL+hErEVLZuikd4P27c4+x02IjKuSbNQfocvGOQMYhu6go/lL9CaEqMcV44QL20vVMSVrXIfHm6jE9e9822CWnwUxX4n@lists.infradead.org
X-Gm-Message-State: APuU4Z/a57PTG5R1w4+Yyrf/CIItJjNUBWxXfDVKg1PP72L2+C2FGwEb
	idUUqc3UR1zqjqg334BZa4qkyIl14RzVayB1OZ8549rNYHsIBxuZ9hf4nloZkFAlBPVkyH1NAFW
	vOy+om2DUAFndOq2XoJCT2D65JYb5LjONpCIMqkucmDO7wmnly51SQPw+8ANePYB2uDgTU2TP0+
	LI+hNIUpAE0EGqlE1rMeL7rOZDB8Vy8L7n2bvfkow206A7UJdOQa8DEQgp1ZHEXhPPxK1ZJtiHF
	GKNIJvQdrMPm+R3KMaxMca4V6UZPkjU0ys=
X-Gm-Gg: AZFdTZeWAnmrFnHIKwLKbTyvzbdd1mIYMvCSFgyeaBx5tocTwNmArVijfjDkCHPe1Rp
	SoQbKWT4P+yTX+BJUrz9MqLW7rF6TUBOCuh35kRtHfI3DTvnaWtT2kEKmz26GlC3LhRpwiApmFf
	CKnGoVIchGLyyFRZFZMfxxo7Qe1XGd6RLb1AajdISfL6787s2XYuuI4P/nNIjS4jWjYi9l2hz6f
	PcNbIrlUS1HoCw7TUme0nEi3hQmVmVyXDbGR1kooLku5NPoylXyHCXEex7xKvabgqJ5AcPGuzD6
	tFwjq4mWcuR6w37Gmanw9lhqKlyokUrdyRVP7JVPC+rPmT8j4JrpbqVUQ8d5KfaU7NSgaU7nRhU
	l4RfhC/Mqwv3yD6Z0weoNnM6UHI9xq4jsWH32Q797tvWpBz0Yxls6phV+aaOaXlRZd2GmRB647D
	7R3bGDcmO4AfKH49980cIBsWPHH0+SnK6h4sqAK2Srgoo=
X-Received: by 2002:a17:90b:1cce:b0:3b1:64d3:f308 with SMTP id 98e67ed59e1d1-3b1b0a3c0f6mr11865838a91.43.1794870562990;
        Mon, 16 Nov 2026 15:09:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm6445074a91.3.2026.11.16.15.09.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:09:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so5858713c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870561; x=1795475361; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JGRKYIhmwCYE3KPUYPJEdw6GaPbg8hbt4OXk4UERBc=;
        b=CHBafn44HdkZ84mGH9ZvhsWfKl02fPGkGYQ0X+0uSDELe1w9tgBO8nEAFj5cEHY38Q
         dtp89/3tE9EBNrWroZH/Odc8Q94VPlimsIOqdZzpY7TawQIDbqbnAU68fJkdasXj+vv9
         aJv7j311hte1fUP5A5bi7qxT5QnBQ6jjwP+PE=
X-Forwarded-Encrypted: i=1; AL+hErGzdbhJhxHUXdV4rG6zFNCE8RFaB/Z5XoDFZEqyCaKqMDBaX/j4ZYCrj5/gOsfVdC1SsbNRfpOsBJDVESx+LGCC@lists.infradead.org
X-Received: by 2002:a05:701b:4508:20b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b50306c4d3mr12089858c88.2.1794870561009;
        Mon, 16 Nov 2026 15:09:21 -0800 (PST)
X-Received: by 2002:a05:701b:4508:20b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b50306c4d3mr12089825c88.2.1794870560347;
        Mon, 16 Nov 2026 15:09:20 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm35222352c88.6.2026.11.16.15.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:09:19 -0800 (PST)
Message-ID: <1b7b63a6-ef87-4a2d-be3a-ec6ee34c6173@broadcom.com>
Date: Mon, 16 Nov 2026 15:09:17 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the
 shared PCB window
To: linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
 <20261029212513.4126083-2-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261029212513.4126083-2-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_150924_034003_41B2274B 
X-CRM114-Status: GOOD (  18.80  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 14:25, Florian Fainelli wrote:
> Northstar Plus has one PCB register aperture for both SATA ports. Its
> per-port OOB settings use separate banks, while the PLL registers are
> shared.
> 
> The 40nm MDIO refactor made all non-40nm platforms use a 0x1000 per-port
> stride. NSP previously passed the shared base directly to the helpers.
> For port 1, the new stride moves the bank selector from 0x1804033c to
> 0x1804133c in the AHCI register window, outside the PHY resource, and
> prevents the second PHY from being initialized correctly.
> 
> Exclude NSP from the per-port aperture offset in both read and write
> helpers, preserving its existing bank selection.
> 
> Fixes: 0ed41b33882c ("phy: brcm-sata: Correct MDIO operations for 40nm platforms")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>   drivers/phy/broadcom/phy-brcm-sata.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
> index fb69e21a0292..b5fb9dff1ae9 100644
> --- a/drivers/phy/broadcom/phy-brcm-sata.c
> +++ b/drivers/phy/broadcom/phy-brcm-sata.c
> @@ -215,9 +215,10 @@ static void brcm_sata_phy_wr(struct brcm_sata_port *port, u32 bank,
>   	void __iomem *pcb_base = priv->phy_base;
>   	u32 tmp;
>   
> +	/* NSP has one shared PCB window; its per-port OOB banks are selected below. */
>   	if (priv->version == BRCM_SATA_PHY_STB_40NM)
>   		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
> -	else
> +	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
>   		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
>   
>   	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
> @@ -233,7 +234,7 @@ static u32 brcm_sata_phy_rd(struct brcm_sata_port *port, u32 bank, u32 ofs)
>   
>   	if (priv->version == BRCM_SATA_PHY_STB_40NM)
>   		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
> -	else
> +	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
>   		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
>   
>   	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);

Vinod, can you apply this patch now since the other 5 went through their 
respective trees? Thanks!
-- 
Florian

