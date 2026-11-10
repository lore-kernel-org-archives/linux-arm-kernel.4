Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46450606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZN76714;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=FUPAm8N1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XDw9TAxp8+PVmYmAoppiNo2R12oIkwagkMS4XyFHbSY=; b=tZN76714Y2naJG
	dogrN5Xx9mTYlgzQyxRHPx8fDVHuMsgWsTmkv8joK6HQ6Mu2kLITGmvvCSMYS6/Trjf2KggSRO/dh
	cBX4t57COs5h+GsTcf3VJWiPdFYSMXUm6Oq6aIDbSqVYNH2ISWWQ2prbANIWIcBGvRQ1QbJVk3cIu
	KGNXt8z3+teJzmLbnjLG3F/0kHxTGieGP26w/L+W7YXf/aZK1nlNqXve0RWneLvTKXAN8GGbn4pn7
	Ur6ymlKaveEzFl+3Gt+CdL2NqworFrb/OYWaBsncoO52JX/8Q/TcV78TRe0nubKE8viJXLSsjYbvV
	B8TL/f5DtjIBUiTWeeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQib9-00000003NAE-1XoZ;
	Tue, 10 Nov 2026 09:57:03 +0000
Received: from mail-m81219.xmail.ntesmail.com ([156.224.81.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQib5-00000003N9M-0kBQ;
	Tue, 10 Nov 2026 09:57:01 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542714690;
	Tue, 10 Nov 2026 17:56:54 +0800 (GMT+08:00)
Message-ID: <d1e3a4a9-7cb2-4345-86d9-f8d1c0156b42@rock-chips.com>
Date: Tue, 10 Nov 2026 17:56:50 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/rockchip: vop2: Find the first mixer of a video
 port with Esmart3 too
To: aiyengar1990@gmail.com
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-vop2-fixes-v1-0-d336e9dd90d3@gmail.com>
 <20261110-vop2-fixes-v1-6-d336e9dd90d3@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261110-vop2-fixes-v1-6-d336e9dd90d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1c4e3a1d603a7kunm6c01c8eb715da2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR0fVkJOSE5LHhpPTBhDTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=FUPAm8N1nOe1ZJvKxUl85v9FSy633IoHhaFi9+BagYYZlyk5Vkd1HjGqcf0KxVFMf6Gm+4uR17d1NKADyKNA1BHrHw+5P7lp4tmMVhQSo/JRnDHzmo/jDhCFTg1aWOd6RCwJr7GyfyQs+6TzIFou49nk5CaHU7+4nXwdYxtciqc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=XDw9TAxp8+PVmYmAoppiNo2R12oIkwagkMS4XyFHbSY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015659_809406_143F4696 
X-CRM114-Status: GOOD (  16.19  )
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

Hi Arun,

On 11/10/2026 3:18 PM, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> vop2_find_start_mixer_id_for_vp() looks for the first layer that holds a
> window of the video port, but for_each_set_bit() takes the number of bits
> to search, and ROCKCHIP_VOP2_ESMART3 is the highest window id, so Esmart3
> is never found. A video port whose bottom layer shows Esmart3 then starts
> its alpha setup at the mixer of a higher layer, or, if Esmart3 is its
> only window, past all layers, and programs mixers of other video ports.
> 
> Search all window ids.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 83203d18865b..2843bfb36341 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1889,7 +1889,7 @@ static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
>  
>  	for (i = 0; i < 31; i += 4) {
>  		match = false;
> -		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
> +		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3 + 1) {

It would be better to add `ROCKCHIP_VOP_MAX_LAYER_ID` after ROCKCHIP_VOP2_ESMART3.

>  			win = vop2_find_win_by_phys_id(vop2, phys_id);
>  			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
>  				match = true;
> 

-- 
Best, 
Chaoyi


