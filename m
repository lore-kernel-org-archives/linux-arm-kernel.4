Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83548606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XQZUlzOx;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N6HB5tvp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XWWBpXSh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=; b=XQZUlzOxanSOUJT8pxLNwZXRmA
	ooBL2+zWlccdYhLMEMBOpbhtNztu8dpGlk1jeOPt37LO3Nu7RAMi999vj5p6/bYwjIIcTqswaHG0H
	Aiu1DqFx10ZIyDQhAO5GYOWdLmYshiiHOAYMdjyIOz7P6ctuxdK4dv75BGsUi0xCQt1wHPaNlIUSw
	ZSZxAf6nSAz7BTLCZNSb2eaMEen9hWpKL82a7WSHJ8NiiY4La3MiXYBAXtVqxkQCexu0T87BIkBBT
	/Nv9U8+7cCKmK6izXR3tjBws2J2ptK639dF8Ts1sKOsUjIl9CTivO+5aMTQOX186Qt8cfE1VDmtpR
	4zRuTWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5ns-000000011Sy-2Bny;
	Sun, 22 Nov 2026 11:32:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV5nq-000000011SO-050C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 11:32:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM86m3K364726
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=; b=N6HB5tvpI22mF/9K
	3aDWVY928iIdAIOgkAPKUi0obor0cDrcwU12+/uI5kl4MlyZ4CZSokWMIKWbp+eJ
	lyUMd39KB4t0xjbtMJtJXfdPtel/IMjCKy0sxidCOUFQm3iZtH1tM9Rui8Srf85A
	J07FuAkMAz76KYJv7+Fe3sAbABxlJhM1dcGk6i/5RuOGVDis7/XoNpd7LwcKDKRz
	r2qz7DEStpszv4/9YCjaDTNIMiRECGTz23p/7aIHNtUdZa5TWFFrjZSmA7GPvEjV
	unRV2o/AfREYoWwWQvIKlaG8MfwTK2K4U+mvAq0wMoEVrCcd7dNLfv1dvd5hZdTp
	plOaRQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w039ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 11:32:11 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so1033917c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 03:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795347131; x=1795951931; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=;
        b=XWWBpXShsGx2y88QVh0ozJ70Z8dsYnsoj7gwyGhhSfhQzdT33T+mj0jXAw0fViPlHt
         zNu0rrKSaFdvLU2M9oO4GMYITRxBaE6puvT5gHcEgohdiBpHLL5RIblI3nK9Ib/xDAvt
         DyskYjVVFUELLsoNYKXCsr/wlrEdXa7aZIfb/hPRXLilCWukyKtTuhj6KzPZ027A3KZR
         iwa1HC5TcspwZkiiTK9+GwT8Z8L7c65Lpz7Vhiesu0YnsEnxIlJ6lYL//IpSUsyNaCVl
         vLiGZMVh3FA0kXTrNgFfny/URjXc9MuamJQuKW/3Lyszy7AfZCiuob8aFVFdQMB48Xw+
         rW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347131; x=1795951931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=//yPmyltKuPn0gdrjRksiDx/e7eXRDb0t639A7DSvGM=;
        b=08em4272mg2vTuwrHmc6y3OJ6CfTgtN974De8jdnpckD3xDVZBPWWilrJeFzFK3HOK
         K0/TIRWn0BvfEZjyXCGKCclEXrDLmt0cCIJ8VSwVFcOyKFdGkw6/WsIIysd4ua0f4JTE
         7gE/1N/qArB2psV4wG5NQhruk/RMLKwYVXGQcUSeBucKRpDK37L1OmNFhHxZbc5JE0OP
         p04iSYhAwDPQIjVEQduoqLlbjfOD71qjPKj86L7Q60C5CA/iDGe8cGwZbdgG/39Bi3vk
         3WxC2RIUpB0fk+ZYe5SPSmU0+3guKSNG3fBSeeScYuTSDLquTfZgbW/sH+XnNbirWMf3
         TCrg==
X-Forwarded-Encrypted: i=1; AL+hErEIQrqOEnWnN/UOvMMBievIrdl3MVpuWkI+6N1BB+0LWUFfK50rUfYerc9+Z1g5dIOSSYyTafx+kj3OE4nae3Pi@lists.infradead.org
X-Gm-Message-State: APuU4Z/zqhrTvRqK8XygfOLhx0B1lgVzOWF6223co2pHu//hWL93vCpp
	904icItWofEuobneSgLtKa26QwDbni2+lCawLlY8LWILDKoTxIP6efVUOQEPperEbxLKB4cZLoL
	ogk1sQ6UbCsR1UJXC9hjRkER7WkPnPchEqTWJXfkOVzlFhYObaDxFtY4lHX2RHlsZT9j7KBv17z
	+eKA==
X-Gm-Gg: AZFdTZfvkQbaIRjOoY3u7QFPGsf8EH7YiAZnN6jX7ExA8DktQ9z7NYSGJmmL08YY1rc
	8zWdIEhuEECmRu2JiaSCVnJOxudIP7DCcWB4qTleIfDt+4WYJWtE55gd0H9jp9o6ziRQ7RTwQQo
	AXBRkcInFhLspvT/Qf6b/tOlLh7pS/QXh5BeTPyx1SP9SAxfDMJ4vtQ67lD338K3nEeL8dNdEqf
	a6sx3Pek2EkSOE2xGZCo07XJcx178lr/jv59dv6Ywtcgtj/Q9jJPPzgacOL6nY9X1EshTGPebZ6
	V8ZLwHgaXCuY9EOEaRx303cOUqlFNoxnHX5kdyxIuJkYXWFOGHD6YH2Ga2BW4S9Th0WzqLHuYyM
	Y4wI5GQfIbQo7jyJDXSZDBugkpVudIPvPVP7TUAaAPsVkLUm+nNJQWFB9DFnnHOY=
X-Received: by 2002:a05:7022:ea50:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b5567b650cmr6883663c88.1.1795347130729;
        Sun, 22 Nov 2026 03:32:10 -0800 (PST)
X-Received: by 2002:a05:7022:ea50:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b5567b650cmr6883626c88.1.1795347130105;
        Sun, 22 Nov 2026 03:32:10 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm33139384c88.9.2026.11.22.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:32:09 -0800 (PST)
Date: Sun, 22 Nov 2026 17:01:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 05/10] net: stmmac: qcom-ethqos: add
 DLL-bypass for PHY-managed RGMII delays
Message-ID: <awLSryYCHGK4mNRo@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-5-c41902e5f2fa@oss.qualcomm.com>
 <179517515873.3136.13386164324921238997@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179517515873.3136.13386164324921238997@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA0NSBTYWx0ZWRfX1dBnHdWumZUM
 xneolHFQcGpCjjdYOgtsFc9NKzX6whNJTqZlsPTc+Ffb5vDmkWYzQOP6Fg7RnqDZxgWQLuoy71w
 dF7ll+3zLfKwnjSwjlL2ouJeJMuxlEybIRpYR0gB8tST8opkEY6yaX5SPZMW/EpUS8RtGFQOjzb
 hoLbVv1r+9iByIevqieZw49OSRe7k1Q7jWF1gCi8/DKBqIVPtZE61gZUuRwktXEDuRquDbc5ppq
 a8LDkvky0+ZVWM5lVacW9rKsp11PctUBu3sdwqXf/efYhBGP3LJNdu55by8Xft/+HXTQZ8QEB4B
 fZMnTiWuFFhvv57gWxycs2+7+sS9UACwZr8TnSPiqgZ1ZvRJELS4TYbla3yzc9wLZKGvnpZsUPl
 nfZdP/6ep1mvbL3VJ5R91oZ/JQ49E4iDsJvPKcN8hgB2cELbqD4tdNcs1bZkKvPhTtVwowFaBqN
 39FlXbT4oivnYSsLEtA==
X-Proofpoint-ORIG-GUID: V15K0nwzw-AjdnmH0qst19ZGOBeri1Ps
X-Proofpoint-GUID: V15K0nwzw-AjdnmH0qst19ZGOBeri1Ps
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA0NSBTYWx0ZWRfXzK77Wf4irdZQ
 w1MnNKLoibot0ts14m6Q5x0ZCFoxOfZTx74UH5bmGtrTmY5b5ohgN+2TB1alx8RT3QhxqyXBQZT
 l8VcI9dFDqNfUYHbp/qQ0c82V15mJ2w=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b02d2bc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=ILAHPzDOMjDfJpBCQgMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_033214_181532_EA60E657 
X-CRM114-Status: GOOD (  34.95  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 11:45:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] In ethqos_set_clk_tx_rate()
>   (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c), the new…
> - [Medium] Speculative: the new RGMII_ID DLL-bypass path returns before
>   the POR reset loop in ethqos_fix_mac_speed_rgmii().
> 
> --
> 
> net: stmmac: qcom-ethqos: add DLL-bypass for PHY-managed RGMII delays
> 
> This adds a DLL-bypass programming path for RGMII_ID, where the PHY
> supplies both TX and RX delays. The path is guarded by a new
> phy_managed_delays flag in the platform descriptors. It also changes
> ethqos_set_clk_tx_rate() so the link clock is not doubled at 100M/10M in
> RGMII_ID mode.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index f2428f0467bbb..99ea7e0cfb00d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> 
> [ ... ]
> 
> > @@ -189,7 +193,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> >  	if (rate < 0)
> >  		return rate;
> >  
> > -	return clk_set_rate(ethqos->link_clk, rate * 2);
> > +	/* Clock Rate Requirements:
> > +	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
> > +	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
> > +	 */
> > +	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
> > +	    speed == SPEED_1000)
> > +		rate *= 2;
> 
> [Severity: High]
> Should this check also look at ethqos->data->phy_managed_delays?
> 
> In ethqos_fix_mac_speed_rgmii(), the bypass programming only runs when
> both conditions are true:
> 
> 	if (ethqos->data->phy_managed_delays &&
> 	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
> 
> The existing descriptors don't set the flag. That covers emac_v2_3_0_data
> (qcs404), emac_v2_1_0_data (sm8150), emac_v3_0_0_data (sc8280xp) and
> emac_v4_0_0_data (sa8775p). With phy-mode "rgmii-id", these still take
> the legacy POR/DLL path and call ethqos_rgmii_macro_init(). That function
> always sets RGMII_CONFIG_DDR_MODE and programs the MAX_SPD_PRG_2/9
> dividers.
> 
> The comment above says the MAC-delay setup needs 50/5 MHz. After this
> patch, these boards would get 25/2.5 MHz at 100M/10M. Doesn't that
> contradict this part of the commit message?
> 
>   "This new programming is guarded by a boolean set by the platform
>   descriptors. No change intended on existing platforms."
> 
> A later patch in the series, "add QCS615 EMAC support", notes that unlike
> QCS404, the QCS615 RGMII clock source supports the 25 MHz and 2.5 MHz
> rates. So on QCS404 with rgmii-id, this could request rates the clock
> source can't produce.
> 
> Another later patch, "set initial RGMII link clock to lowest speed",
> changes the probe-time call to SPEED_10. Non-flagged rgmii-id platforms
> would then also get the halved 2.5 MHz rate at probe. The issue is still
> present at the end of the series.
> 
> Would it work to use the same predicate as the bypass path? For example:
> 
> 	if (!(ethqos->data->phy_managed_delays &&
> 	      ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) ||
> 	    speed == SPEED_1000)
> 		rate *= 2;
> 

While there are no current users of "rgmii-id", I will add this check in
the next revision just to ensure that this new patch is independent of
the legacy RGMII handling.

	Ayaan

pw-bot: cr


