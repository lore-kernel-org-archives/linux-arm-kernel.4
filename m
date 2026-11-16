Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGIPXm1o;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=QfMIkUsa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bvUfi2oQHvIeYYvb6jd/QY++S5Ve+5EUv86wa8p023s=; b=qGIPXm1ozN3u16
	Xa3kwCMKXU5ejdSOsmnvUbosvwBAi0xCDO+WHjHeE2KcGQHCckPy/4GrUrkh0jlZNj524nxh6UAxA
	X60+CoG3g4tarAc+7bCd41SggCb1tye/g7vByaCY3uCIMWdyFafSbFpkXrJw9+G5AvXXEQoDuOxe2
	1Q9mvir86DiZyRpWNec4XJosZWbRy/kaxKZHDRHzNTeY1uXILwcatZqX3H572RYUo6YERSLOyQP7v
	eAz5TIb/UWVyqe8CH4zKgfeJp0JNvjkBqQ2Jduavx+NjwOIpk/She/hFiQW2NDLbxDWgRM4c+l4mf
	APLViO4S6aiMr5lDHc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStap-00000001tTA-0ofa;
	Mon, 16 Nov 2026 10:05:43 +0000
Received: from mail-m3288.qiye.163.com ([220.197.32.88])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStam-00000001tRR-22vw;
	Mon, 16 Nov 2026 10:05:42 +0000
Received: from [172.16.12.74] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54d53c117;
	Mon, 16 Nov 2026 17:50:26 +0800 (GMT+08:00)
Message-ID: <2e46d108-ebbe-4824-a428-94d146c66911@rock-chips.com>
Date: Mon, 16 Nov 2026 17:50:25 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add two reviewers to the Rockchip DRM entry
To: Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, hjc@rock-chips.com, andyshrk@163.com,
 chaoyi.chen@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
References: <20261110101554.1809467-1-heiko@sntech.de>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20261110101554.1809467-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e3c3dbc103a8kunmf0affbbc2161f8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZGUhNHVZISBpMSEpIGU
	wYSEtWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QfMIkUsatJerA45O7rKlgR4Q53F50PWHQdkRUXAyfpBML9rQ6CmltukIokIvCdq5OZlK+U4gZBnFfBMUyG0DzsRyF4EXKWfc6P5e7h6V6drCs/bq0zy+/EV80lWjclX5RMNWFsN7fPat+zhubFarG71CrC5b5v17Bh/6Vt80esM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=bvUfi2oQHvIeYYvb6jd/QY++S5Ve+5EUv86wa8p023s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_020541_022001_2493B685 
X-CRM114-Status: GOOD (  10.34  )
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

Hi Heiko,

On 11/10/2026 6:15 PM, Heiko Stuebner wrote:
> Chaoyi Chen and Damon Ding volunteered to become reviewers for the
> Rockchip DRM drivers, so add them to the MAINTAINERS entry.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..99142a911350 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9139,6 +9139,8 @@ DRM DRIVERS FOR ROCKCHIP
>   M:	Sandy Huang <hjc@rock-chips.com>
>   M:	Heiko Stübner <heiko@sntech.de>
>   M:	Andy Yan <andyshrk@163.com>
> +R:	Chaoyi Chen <chaoyi.chen@rock-chips.com>
> +R:	Damon Ding <damon.ding@rock-chips.com>
>   L:	dri-devel@lists.freedesktop.org
>   L:	linux-rockchip@lists.infradead.org
>   S:	Maintained

Reviewed-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon


