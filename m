Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81314606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zxztmkum;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KI/qRF06;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiyNngVp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=; b=ZxztmkumRc5uA2
	pjqZliJyGlx0QPzhhA6Kp301lu5wKjG4MlZg+1EcGTzW9hCLSvo4agXJ25e2Y7lAaKQS4xEqZHE8S
	EjX88a6FmuJWAeMfcYVvRwWUT5GroNm0pbxYyk9pDb3GjJqMqaADzrbYkUx81BsgMZ/Sah/EbxjzY
	r6Dyu0CifaQCHFW/nYW3WTHC4+YbnG3V7QW/XS2rUW78WPPHDew0ewf5sMBzkSSmqXpxJnjdAEnYl
	CERS0U4qyX2YN+G0KUEiTUL6G5+3KgZGJtH+E/bpSvHMjVEA8jEy99FADyP9GXFttfsRrHhDKDN33
	WyBjy8eaE4nFWXjLqIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKjg-00000008Xt2-1EIb;
	Thu, 12 Nov 2026 02:40:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKjd-00000008Xrp-0YZt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:40:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zc9q4149412
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 02:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=; b=KI/qRF060qDr0r2Y
	cJuOgXtsBpuDssWcFJlKOO1nnz751BpTeh9oz1oPGvjmslvWwhtLwO06nYw9Mz4r
	ecj4zy4uuMABNaIYsfdpdtFlcLHOb0GPfLodjZXjXNDK8Vf+XQwfP+fvVcSjA1fG
	8h4TorsRex4rX7DoDD7Xb8uxUGXLLNcE7DByWRDzOUXxuwCBoKiBaRMH9GFL3BUA
	/SVMy9oqTiO0QrtV7oovqEHmjChkcnZA0sdNFtNSTh5HzTW33BNQPX4QbldT90Az
	F5ZYYFXjKa2Gozlp/vRRIx8hfdaKFek54kf3AKzEgLxcExHQcVbuPbqhhr1obTxj
	daAuAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc61b5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 02:40:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535131e4c25so77715761cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794451219; x=1795056019; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=JiyNngVpyNY6NSzp/tmEW5EBraHtg72fHFEXQkdAx4zKs5LA5aChcKAAorA+xqskrS
         nCyGmuUpoInkQckky5su+E7JTZ6kYjjNXyTJlbfKZVkMmeD/SBLQ+oBvPX2VNeFzTBBH
         eFVsGHTIBZfGZgxwRBw48NZGu0JAoPtAGrJsaKeTrGWlBNwXJ/EAlztS+2BiQbDS5+sI
         8FA4XYOW5bddRJVn7/YyZbjV38cdEwCcG9fLHLNj+K7V0YmlI8q9g61xn3D2IxYSXBmc
         KhUxNgSn2ZnGn64d/hNBKOttJ42q9MukbKA+x9CB8GlLec7cHHnACbyK3Lvtm99B/dXp
         +eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451219; x=1795056019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=nlKVKc+77uB1P2/aN+anAicnMEtLbOl4p1CSgdcPHCGSVIeZAjB/VvyQFfskjEw1Bi
         zz6/nbwLTPWVtDbZKCH5N8QYCAhVb5pBCCajo5/S2wnSoh/zCaXzS0nAbRw9iDzy/8Rj
         yvS67yw7JzEHSxlav4aw0RA8qCslulzsfuQAKW1E65X7T+hEAPtlQpn9gSA0RFs28Zdy
         E8Jr/w4xfRl7IoNR1deKq7sXvWIsghnNmCgjWitdOCLfntywjsBW6HRzmFsuQaWis66z
         PNQ30fK10HX/NUAO+WGCoj7hMpDushmnm4pilQ/V5mMfJtfdVj6luEDgTMV9PTSrzmO3
         qCgg==
X-Forwarded-Encrypted: i=1; AL+hErEQAyhP0u1OzPmrtx7sEPG4R9QZcPqT0sgRMlrzt/5iPW1abWaLvQ0xQthfiJPm6lCrrHdG4Bvp7b/QKrff29Y2@lists.infradead.org
X-Gm-Message-State: APuU4Z81Pk14I9MSxmHNIze1r+JDNjYPmRDCGf2UI2e232HIA/sVDEuP
	kB1IyP+Yz88dIXgGGINuzOR4LooD7GAXxmBioEg2oaiGOCFn1q8eCwQpQWzCUNRKfyYoq9yZHV0
	KjNj2ssxcr6eq+VlGpj7AD6norFPsAInFNwYiLRDqbXnsc7egjjtKwvtuy73f8A1D83wRnhhXmC
	iSqQ==
X-Gm-Gg: AYBFou2/gWGgK5ESED19bi55TC+8z3d86AIwMuAJp/+krW9MURU04Mo7wbYRYG/tF2g
	cytXvUw19Prvy5Sz2Ia2o2p7QKzOe3Rt/febD3vPMH/eJsHgghs/EO6Oshi7nyy+V9oYJo6Igsg
	m5+xDagfe8fCd4YggnxbEW2SN+uiMhL7YsRpmuagKbAkzs0c2XKGNzJsHAwDXEDSCXJYGN8uOM/
	vhv5UUs8dGfGTGxg7FZPy+i0m6147168/yzrS3nodFXNfFGtMFDk+ejg5od36AfxZ9t1a9tWICY
	B3j4YOLoSD2BgXRBDXr+WiPXUNM3lQTu7gxLqhs+A4sNDR/usXSCZmfGvfyRJaRAn7sHUgBPQsH
	wn3riTNEDd8QVcMM+smzsf53xxZg2g8e5MlJ1Jv+6KfQ9YEBJDsBZs+XLxv4vZk5pRvnr+XaJKC
	4uNN7mrjyg+HCj4fYcvTjUGlvGjFKkcTyOFvqNrZU=
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64865941cf.65.1794451219025;
        Wed, 11 Nov 2026 18:40:19 -0800 (PST)
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64861391cf.65.1794451209677;
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bd33340sm64426881cf.21.2026.11.11.18.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Message-ID: <ffe9dd90-909c-4259-8a57-2ea67307a95b@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:39:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman
 <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RI8GcMNpf_5OTJKUqpmNlxhgY--WgQhD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX2StsWiHlF89I
 vshw6PkVjAozePZ39ENEPHHx1Qa1QNMTLeEtOi/GHc/HARv0O6P9u20hdpAN9FMJ2alSegVNjgP
 8wbzEE4CM4S3ZjOK4BGmYQmrKiDXJKoTjQy/HbIjsRPdVBN/bsUT8aw0mcqk1GaiHYUGkGR2pjy
 L+USeuaX0p8kCZ3KXHrZJpWM98cWcaK9yzyBXdLbNBrvaYoWb2qYQAhLRCppaQSFpTFfU0Eo7HI
 7c3joRXEusG1NKTbu3jrtLvvLag2z2HMsRRaFgStvsf78RTcgPWvKrtM8qiXig3ggkkKux2cei5
 E3tjxcWAlN+EokHHGmFnAyFVB89EEs3tQg+sVV5GSKG4rqeXCzfjUz9aZDs0dqs9Yqyrl+iJ65o
 qkgHKx6oL+pTObl5v52oqoHHbUgO/YXjrL3UcOsj1nzyWnwcnGWosnLHSPT9wxbDbD1ixvAfnUZ
 z7duAwWSZrBa5LPUsMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX2d3mxtMQ0KE4
 a/eZTvFQBkl21InBN5254WzPP1WlixZfFM0XwirQOblRlTjeLmqTc6B+j5Ec7t3phkkPIZRoESg
 QJc1SX3VVkVBOrPGGeN6pQ9aad8D4yI=
X-Proofpoint-GUID: RI8GcMNpf_5OTJKUqpmNlxhgY--WgQhD
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af52713 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UkfVDg3vQ6na--iosyQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_184021_583559_1C5E8F1C 
X-CRM114-Status: GOOD (  22.56  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/24/2026 8:35 AM, Dmitry Baryshkov wrote:
> The upper layers might signal multiple sequential HPD plug events. Don't
> take extra references and skip all further HPD plug events until we
> receive the unplug event.
> 
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fa8942922b53..ce919a26fba2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>   
>   	guard(mutex)(&dp->plugged_lock);
>   
> +	if (dp->plugged)
> +		return 0;
> +
>   	ret = pm_runtime_resume_and_get(&pdev->dev);
>   	if (ret) {
>   		DRM_ERROR("failed to pm_runtime_resume\n");
> 
Hi, the issue reported by the AI is real. There is a regression in the 
SST case: when .detect() runs first, it sets plugged to true. As a 
result, when msm_dp_hpd_plug_handle() is called, 
msm_dp_display_process_hpd_high() is skipped, which causes the 
subsequent failure.

I tried removing the plugged update from .detect(), and that fixes the 
SST issue. The display works now. However, there is still an 
intermittent issue where the wrong resolution is selected. I suspect 
this is related to the timing of the EDID read: when fbcon comes up, the 
correct EDID may not be available immediately.

