Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10DE606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYI1xJE2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAXXIOSd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pcVu9EMSsefYLymrQtl8LupCbMPRgg6akpslMtZ5jus=; b=vYI1xJE2If+EA4
	PtGEB/fpZGvnKDXXl6g5OnHcKwMNc5PBPjWEbhBpw/QNep34+axw5qaupdxckpaly8j6C3gTnLJmO
	5soV6d9oAfDQ0lkIQM2iA65pJoTeyX3x7eBq7O284Ljry/Zurb/o6JxkrorkXklS/ILgMGC/cC+3Z
	orsnBShbfQmfCdWcN7EJGq+50/61yO+sqZ/L/ztkxGDyGfSXeUEWW2p+5N/VHnOn9rafC43jiFFXb
	gClqHwFp7LJiDTsucSyx5hP+iYFvCOlZOttBGWMVkeL6L2I02CrQ1/oEolgFxdAXT1RgNLPlTsZWg
	Su0AvlYMOnxzJEfJ+rpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Hs-000000093eH-2jiT;
	Wed, 25 Nov 2026 08:23:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Ho-000000093cK-2s6V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:23:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19B8E42E48;
	Wed, 25 Nov 2026 08:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9361F000D0;
	Wed, 25 Nov 2026 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595007;
	bh=pcVu9EMSsefYLymrQtl8LupCbMPRgg6akpslMtZ5jus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hAXXIOSdeCMZpSaXr6Prsk7LMFY3xIq8/4v7hVjMGlmywb+hy8GiNBNhJahumPLQ/
	 post4M/F1MOvUHIZZsPwVYMITfdk5TUgi+dJHYN0ok1UkNWXWDIpR9sV/NCggX4gDb
	 CPdYBbtHq8N/cIXuYudDi1VFvx8h7cE0Y6DIcSPqIlFl+RvtVSe1/RlWxe5MC4trvV
	 A0KhEtBEZWa4smxg7X8OGgyxjBXur/KBaQCJQ4S+Uwk9SjICtyIkUbeAwsFH5h54Wn
	 IUK/X3aEkXhQIBrzZA48ltJcOCj2gq0SGVeLXmBDAbi+S75MMK8yZLRFeA6cnD8all
	 yedaSNiEhahBQ==
Message-ID: <5f86acc5-5774-4a5a-b60d-1659ee2f7725@kernel.org>
Date: Wed, 25 Nov 2026 08:23:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: imx-ocotp-scu: assign nvmem_cell_info::raw_len
To: Stefan Ghetu <stefan.ghetu@nxp.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, Christian Eggers <ceggers@arri.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261125072736.769516-1-stefan.ghetu@nxp.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261125072736.769516-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/25/26 7:27 AM, Stefan Ghetu wrote:
> Avoid getting error messages at startup like the following on i.MX8QXP,
> i.MX8QM and i.MX8DXL, printed once for each MAC address cell:
> 
> nvmem imx-scu-ocotp0: cell mac raw len 6 unaligned to nvmem word size 4
> 
> The same was already done for imx-ocotp and imx-ocotp-ele by commit
> 48b5163c9575 ("nvmem: imx: assign nvmem_cell_info::raw_len"), but the
> SCU based driver was not covered.
> 
> This shouldn't cause any functional change as this alignment would
> otherwise be done in nvmem_cell_info_to_nvmem_cell_entry_nodup().
> 
> Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")

cc Stable is missing.

> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
> ---
>  drivers/nvmem/imx-ocotp-scu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
> index 20312fba22d23..80f78bcf3841e 100644
> --- a/drivers/nvmem/imx-ocotp-scu.c
> +++ b/drivers/nvmem/imx-ocotp-scu.c
> @@ -218,6 +218,12 @@ static int imx_scu_ocotp_write(void *context, unsigned int offset,
>  	return res.a0;
>  }
>  
> +static void imx_scu_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> +					     struct nvmem_cell_info *cell)
> +{
> +	cell->raw_len = round_up(cell->bytes, 4);
> +}
> +
>  static struct nvmem_config imx_scu_ocotp_nvmem_config = {
>  	.name = "imx-scu-ocotp",
>  	.add_legacy_fixed_of_cells = true,
> @@ -227,6 +233,7 @@ static struct nvmem_config imx_scu_ocotp_nvmem_config = {
>  	.owner = THIS_MODULE,
>  	.reg_read = imx_scu_ocotp_read,
>  	.reg_write = imx_scu_ocotp_write,
> +	.fixup_dt_cell_info = imx_scu_ocotp_fixup_dt_cell_info,
>  };
>  
>  static const struct of_device_id imx_scu_ocotp_dt_ids[] = {


