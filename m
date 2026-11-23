Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E460606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 01:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZSi1cWM;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=GT3jbs/W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LliMgjnXMFNyw0KxKrefKqjXgD5lvXyOXgtZPmEuFlM=; b=dZSi1cWM55UKri
	s3LE4hl9kZYMSFoDKYHm6cydiNFYs4S7tWCN3INfzwSNL+odNVuteWzcwc+IXpo2h1sD5YxWTJEHE
	b2s6I7GuZbsAkWgajqm8Bbj16alRTMQ36sI1N+CSWnbKRpFYNLfRy7ie3DHa2MqTkH3IdR1cQCYuB
	af0xEH/4xvYHefEU2GxaYv1NkCvuNX3Vkbfi6MKTOLlC9KSR0lc4CuaU8kgwI1Nq91PS/YsJx9fyd
	aGOfE+4Nl5EGDy0ZFVZZEgm+dtAlVn0pi9hqEceG9Qj6i/m05I7wuiE+AnxMObqdp6pxynx+xLp2s
	1mbYfAJ0rJuZIYYu8mAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIoO-000000024vl-34dZ;
	Mon, 23 Nov 2026 01:25:40 +0000
Received: from mail-m83212.xmail.ntesmail.com ([156.224.83.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIoJ-000000024ud-3C9e;
	Mon, 23 Nov 2026 01:25:39 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5594cef32;
	Mon, 23 Nov 2026 09:25:29 +0800 (GMT+08:00)
Message-ID: <0befeff5-c51d-4c4b-a85a-b00835889664@rock-chips.com>
Date: Mon, 23 Nov 2026 09:25:27 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: rockchip: inno-dsidphy: fix 1.5 GHz rate units
To: ZhuXiangyu <1194781887@qq.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <tencent_6A9CF9A2529C8FA2C04933F2D5D1A259B506@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa2060212fb03a7kunm415fa07ab4eba9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTE4YVhgfQxpKHUweThkYHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GT3jbs/WA5Wwx71x54Vye2Ydhd1iE17VsTClqOa7d6cCPDGkX8CbWc7o5X5NBn9zVdfZp66mexixazzG2g15WTqX1CcAUxdW9phTnwi4Q3mrOlCnuuuoIcf97JxnBauQ3YUyHxV9cVtSWjEJSZ1e0IFNxhHEsVjUMi5/Uzre2S8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LliMgjnXMFNyw0KxKrefKqjXgD5lvXyOXgtZPmEuFlM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_172537_383698_8D9C5A66 
X-CRM114-Status: GOOD (  15.51  )
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

Hi Xiangyu,

On 11/22/2026 1:11 AM, ZhuXiangyu wrote:
> The 1.5 GHz Innosilicon DSI PHY timing table stores its rates in Mbps,
> whereas the other timing tables and the lookup loop use Hz. When
> enabling a mode, the driver compares inno->pll.rate in Hz (e.g.
> 372000000) against timings[].rate in Mbps (e.g. 400), so no entry
> matches. The loop falls through to the last, fastest entry and programs
> an excessively large TLPX/LPX counter, preventing panels from decoding
> low-power DCS initialization commands.
> 
> Convert the 1.5 GHz timing table rate values to Hz so the lookup
> selects the matching entry.
> 
> Tested on an RK3506B board: the panel receives the low-power init
> sequence and the framebuffer console displays properly.
> 
> Fixes: 785a9d5bb145 ("phy: rockchip: inno-dsidphy: Add support for rk3506")
> Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
> ---
> Changes in v2:
> - Split out from the combined drm/phy patch into a standalone phy
>   subsystem patch per Heiko's review.
> - Limit recipients to phy and Rockchip maintainers/lists.
> - Fix Signed-off-by author name formatting.
> 
>  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> index 6ad04b0c..fcf7aa17 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -282,20 +282,20 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1ghz[] = {
>  
>  static const
>  struct inno_mipi_dphy_timing inno_mipi_dphy_timing_table_max_1_5ghz[] = {
> -	{ 110, 0x02, 0x7f, 0x16, 0x02, 0x02},
> -	{ 150, 0x02, 0x7f, 0x16, 0x03, 0x02},
> -	{ 200, 0x02, 0x7f, 0x17, 0x04, 0x02},
> -	{ 250, 0x02, 0x7f, 0x17, 0x05, 0x04},
> -	{ 300, 0x02, 0x7f, 0x18, 0x06, 0x04},
> -	{ 400, 0x03, 0x7e, 0x19, 0x07, 0x04},
> -	{ 500, 0x03, 0x7c, 0x1b, 0x07, 0x08},
> -	{ 600, 0x03, 0x70, 0x1d, 0x08, 0x10},
> -	{ 700, 0x05, 0x40, 0x1e, 0x08, 0x30},
> -	{ 800, 0x05, 0x02, 0x1f, 0x09, 0x30},
> -	{1000, 0x05, 0x08, 0x20, 0x09, 0x30},
> -	{1200, 0x06, 0x03, 0x32, 0x14, 0x0f},
> -	{1400, 0x09, 0x03, 0x32, 0x14, 0x0f},
> -	{1500, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
> +	{ 110000000, 0x02, 0x7f, 0x16, 0x02, 0x02},
> +	{ 150000000, 0x02, 0x7f, 0x16, 0x03, 0x02},
> +	{ 200000000, 0x02, 0x7f, 0x17, 0x04, 0x02},
> +	{ 250000000, 0x02, 0x7f, 0x17, 0x05, 0x04},
> +	{ 300000000, 0x02, 0x7f, 0x18, 0x06, 0x04},
> +	{ 400000000, 0x03, 0x7e, 0x19, 0x07, 0x04},
> +	{ 500000000, 0x03, 0x7c, 0x1b, 0x07, 0x08},
> +	{ 600000000, 0x03, 0x70, 0x1d, 0x08, 0x10},
> +	{ 700000000, 0x05, 0x40, 0x1e, 0x08, 0x30},
> +	{ 800000000, 0x05, 0x02, 0x1f, 0x09, 0x30},
> +	{1000000000, 0x05, 0x08, 0x20, 0x09, 0x30},
> +	{1200000000, 0x06, 0x03, 0x32, 0x14, 0x0f},
> +	{1400000000, 0x09, 0x03, 0x32, 0x14, 0x0f},
> +	{1500000000, 0x0d, 0x42, 0x36, 0x0e, 0x0f},
>  };
>  
>  static const

It seems I cannot apply your patch. Please consider rebase it.

Other than that, it looks good.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

-- 
Best, 
Chaoyi


