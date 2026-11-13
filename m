Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC658606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X3XegMbn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTcgO0/C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FO33QBb9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+JYMMpCVPwHEySjKZ4MO385sOzZpk/O6E4s1/29JGB0=; b=X3XegMbnoh1nPEmr80ag5Qe+4u
	8xvKDyu/tZBNna53LvHbhsRHsamytajGpoCcIc9/yvpsbT4PCZQ9I92vuoWXlCBkozyr64TW949tm
	zgAY/5RuEovytvgQqSaNdyVbnSYcX8AyEuK+zxEpAPGoxJ8I4CBfoyyXYiZFD5Yjm2JwlVJcDNqii
	j2XoDSt7lBO+i59M8vMHgQj1T8vHtvg8KIOioL7wK5SM0CDBE7kbBR++zL90pMxoMAbeIljVsJY7Y
	MEjNALXPNgnxgXK2Z6g259w1FOEIm2F2KXZ+hsplESL6XA0tRatIwzbLjSYkqSveEimgvmEImpQ53
	DKNSvRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgbK-0000000BTBy-376T;
	Fri, 13 Nov 2026 02:01:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRgbH-0000000BTAo-2G8N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:01:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACMteQW2309117
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+JYMMpCVPwHEySjKZ4MO385s
	OzZpk/O6E4s1/29JGB0=; b=oTcgO0/CxjO0e8z4oVQVprI6VdN15UA8lJQGJu1q
	tyBu/wAD8y1YGXonrQ0yztdHxEhCm3SwHIk1lMTpsGcUZDPuogrRC0K1FLmB2e2R
	py1qDcOWDo4FuUtr43UHcAagssgUhG8AuI2oT0NVCyrA6QVjVqjCLzIuZ8whj/O3
	+Np4j5FpijpQY8IqKUQd6+U9QSZUQpzZLbbFIpTOSMKI1CfTpRVW5Ow/faJ4rZ03
	DXyZ2oiGWQueegJxT2xdRXqWp4zKj/VbOJqSXVNQ1yW+s+YIyCy8fXOy9cCBNeLF
	ub3sa3SscZxq36yv4FsrOsB92oi6TfXJYFICDv01gL6JVA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4u7ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:01:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so549534eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794535269; x=1795140069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+JYMMpCVPwHEySjKZ4MO385sOzZpk/O6E4s1/29JGB0=;
        b=FO33QBb9p7FS/pZGOHymDOAadFqbulCu4ecx9FWWZ2cVGbhiXmN6qdbWQKzofUPg8/
         aP64tg4jeh9krG7tTT6EzibmqYuG1M4u9yGLopRZPs4usfMNtAFOq7piXmYsdo/d4KHo
         wo1Hy7MIW7ZO5t2+PzMXHGdOZs1G4kjeIjvKd2CZfiNM4UJFTC0s8Gzxm4ucbPswpYcl
         c+0OAsrIgm89hH2h9CS2cWxpOPLXRhs9Ebqd1/GlFQR6YsHuMmWvtRf5oizNwET/YXdY
         f8BtIOIrv/jCZqNu/2KXlGkMYi6NrEnQQAZdSr8omQttdLZng1zv4uRK71AR1xuyFN8i
         h3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535269; x=1795140069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JYMMpCVPwHEySjKZ4MO385sOzZpk/O6E4s1/29JGB0=;
        b=QRwXb+Zw4kXcww5aVoGJKMkg3fTPrdIgNsi3sLSun7qMg3Ef/HcPAKw8Ug6F2xX2Wb
         hl9LS0/ctdxJNHApJb49vYB4jrlvHJSlP5jtvWDNvBm2HHhLT0/da8KbvjDIOJeG1aU2
         hiJ6rnf0ShomMYiabt1lXl2YXgrClsf4eLOwpgAbGt3+eX0S0kRRa5lHnbEthxg6jPxi
         uX01K2ljz4Ec0xcrJQtZRyXx7I1rrCFEt1vqaPdlj0cDOJT9F01RdQm/RS50qMm/4C/l
         XPC3fWYo0EioEX5ysAAsSzqEtRYSIDrUxwBhp10/dh+jO12ZF3ujF7OSRQKAqIBV3cU9
         uKew==
X-Forwarded-Encrypted: i=1; AL+hErEbiG8/42lizIMFbbSlxgnUFixx5R4/2DxjVS/m21BeDorbi9ma1YfDU8GluPROjRGr3qQXrHlce3W04GB0OX3c@lists.infradead.org
X-Gm-Message-State: APuU4Z/3XOL+5YGoAoeHwU1r6xnKa+PHxros+2ZrIce0b/114uurWCc5
	t+sspjJBp5IBbVxR7H2yos1gM9e9xZJ/8JXIQJXAAjx+mqNPmajKcqwIuCpERECOuNpXrx0GUR9
	86CD6b7KOLpSNKPJCfSsePjo65NY+YKCnITNCRCVUpZU9AwQftwECkwq91Qs8FDXgcGk+U0tywR
	jEkg==
X-Gm-Gg: AYBFou3Vh1eBazAeP6qP/7n+vDHAblGYHlyRq1dUTVPJQv9H40ZwTBxQ4AivnvXayZk
	V3UtlFPukzJowyJTBWoPiVB2wnPJYW+OSMD+vy7+v0fQKrqF5CmTrH1RqoqkHVryUj67Gq9kNa2
	Ioz8dfXL5Cg7Cxn5+t+a0Y4t8jgxxz/MBCQ0kAccmeJzC7n5uQCd4X6bSictQUHqcrAuh91jhFC
	tmaQkIidg0iJeOkGNuTwucNeEn4huDHCXo3MtB2JImY3c+x9wEg3POHoTRsEPsr9UdcfUyaea2H
	0NZZLiWmLnspUJ7Iq+D4obn5TwYHBqdoh8HH8oZ+m0U34g2fVfZgWuaFI11/7LEWb6lDT0ydTlM
	bOqlCQB5h98f3dbpa2bynH98HOgpjPnkxmWq/2jZ7l4KVWoGewWaeSF3V4cuk/FTM0byJ+Hnf92
	3DY0N2xp4d7ZkrqgqT51oD8w==
X-Received: by 2002:a05:7301:8617:b0:370:cc56:b61a with SMTP id 5a478bee46e88-37967dd6065mr854068eec.39.1794535269055;
        Thu, 12 Nov 2026 18:01:09 -0800 (PST)
X-Received: by 2002:a05:7301:8617:b0:370:cc56:b61a with SMTP id 5a478bee46e88-37967dd6065mr854021eec.39.1794535268371;
        Thu, 12 Nov 2026 18:01:08 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm2319806eec.17.2026.11.12.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:01:08 -0800 (PST)
Date: Thu, 12 Nov 2026 18:01:06 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
        kernel@collabora.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Message-ID: <avZvYlYyL3Doc8qt@hu-petche-lv.qualcomm.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
X-Proofpoint-GUID: sANyLp_ohRH2e6Pdo9KPuKp3F7-ofaSW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAwNyBTYWx0ZWRfXwkOa35t13BJU
 7XZKs32Bkkg+cDWTvoTWFzWr3ccjX/ZnEskQVy9ENilLBcQ55dXmjqR/v9hTuLa2FKp1h4aZfsa
 NIO5X5n/acMDCQ/5wC708lKh6t1ShS8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAwNyBTYWx0ZWRfX1GEEp/yocG4K
 gVhdG1dx9dcFInf8jCoGPjpnlOZglFQEyi5DFJb/tx+6Z26JXy54LXzSj8DEaDAsZloX1/4CXl7
 hJDaGmv5L9Ivdg8g06Kq2Zos8KsZuICv+Ls+snAD0S8JHJHMxTLBPT655fzBnd/DVrNGzia2AXf
 t/mkelkDy/qhlCxaMF6trUbQ7OirQwq6D+PydC+nKpBwhqNQK+9OmRwvkM5mRfj2vp5X0cfy3Wt
 FYdo/zrWSkdJYmAZIzuoL9qDOnWCwxxWWSRXKw1MR2qJxqxTs6jlniPXwnjjKa5ptLLZp+QBXQd
 VYRTx12MgGnWWA/BxeVrbF5204PtvdN7xLUapMgWfyYKliE/TfnctR/gOGn5zBreo8CLD0rjmzG
 KrO6FrkVSzewfL+3dubj13RM/K/z9FSiu+owKoHAUYZ2p2p+fSeY90aFNXm07poZ6tu4vGLUgtQ
 So0upwkJ8HnlwtenQhA==
X-Proofpoint-ORIG-GUID: sANyLp_ohRH2e6Pdo9KPuKp3F7-ofaSW
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af66f66 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=QX4gbG5DAAAA:8 a=HK-piK3jiULfHIWbwDwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_180111_688710_BB4BB7E7 
X-CRM114-Status: GOOD (  33.64  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-21 20:05:25, Sebastian Reichel wrote:
> - drop generic PHY reset notifier API; I discussed this series at Linux
>   Plumbers Conference with Vinod Koul and he prefers a local driver
>   hack/quirk instead

Hi Sebastian and Vinod,

Sorry to jump out late, do we really decide to use private callback between
USB controller and USB Combo PHY, and notify PHY's reset events for
controller? Many platforms which support USB/DP altmode feature need this
requirement, besides Rockchip, Qualcomm and the platforms use Cadence USB
controller and PHY also need this.

For this scenario, USB controller works at USB3 mode (also configures PHY for
USB3) first. Later, Type-C/DP event tells PHY that it needs to work for DP(4lane),
since this event doesn't go to controller now, sudden switch PHY from USB3
to DP (4lane) will turn off PIPE clock, and cause all controller's event which
needs PHY (PIPE) clock abnormal, that's the reason why controller needs
this PHY switch (reset) notification and let the controller know it needs
to work at USB2 mode from now on.

So, it is more like a general requirement, but not quirk for special platform.

Peter

> - rework USBDP and DWC3 rockchip glue for the local driver quirk
>   using direct function calls
> - Ensure that the reset handler in DWC3 is only called when the PHY is
>   initialized (and thus DWC3 is running)
> - Also set vbus in the last patch when dwc3 is configured to device only
>   mode (in contrast to dual-role mode being in device mode).
> 
> Changes in v16:
> - Link to v15 (sorry, I missed force setting the revision for this
>   part in the series split, so the series says v1 in the patch subject):
>   https://patch.msgid.link/20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com
> - Update first patch to also build the PM functions even when
>   PM is disabled
> - Add new patch for defining an empty usb_udc_vbus_handler stub
>   when USB_GADGET is disabled
> - Add dependency to Rockchip DWC3 glue, which disallows the
>   configuration with USB_DWC3_ROCKCHIP=y and USB_GADGET=m
> - Collect tags
> 
> Changes in v15:
>  - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
>  - Avoid #ifdef for CONFIG_PM in the new glue driver (Thinh Nguyen)
>  - Do not add #if IS_ENABLED around the DT compatible blacklist in the
>    generic driver, using the glue driver should be mandatory as the
>    generic driver results in arbitrary system hangs. Thinh Nguyen suggested
>    updating Kconfig for this, but did not clarify what that means.
>    Current Kconfig works the same way as the other mandatory glue
>    drivers.
>  - Split series to simplify review
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Sebastian Reichel (7):
>       phy: rockchip: usbdp: Track PHY power state
>       phy: rockchip: usbdp: Add reset hook support for dwc3
>       usb: dwc3: rockchip: introduce glue driver
>       usb: dwc3: core: add post PHY registration hook for platform glue
>       usb: dwc3: rockchip: add USBDP PHY reset quirk
>       usb: gadget: define stub for usb_udc_vbus_handler
>       usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
> 
>  drivers/phy/rockchip/phy-rockchip-usbdp.c |  82 ++++++++++-
>  drivers/usb/dwc3/Kconfig                  |  13 ++
>  drivers/usb/dwc3/Makefile                 |   1 +
>  drivers/usb/dwc3/core.c                   |  17 ++-
>  drivers/usb/dwc3/core.h                   |   9 ++
>  drivers/usb/dwc3/dwc3-rockchip.c          | 227 ++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/trace.c                  |   3 +
>  include/linux/phy/rockchip-usbdp.h        |  31 ++++
>  include/linux/usb/gadget.h                |   5 +
>  9 files changed, 383 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
> change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> 

-- 

Thanks,
Peter Chen

