Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D64606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rHYaNacV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gINNI1pH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WK19HVy9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=; b=rHYaNacVHdZziHmFRYYm8Nsbqg
	iR2fE/skkbYer2sy/hHcFUiPdgorM3halnFiQQhstykf7pAobcGZm8QpFyUOuQ9cmZs/f1g7yHUoz
	/Yju1ExDdeOdR0yghSOQ7pDU2sJ1Jp/vr5srK5vblHI9zfJNderOIs1aZcnq7lAHaaiLzAVC2qX2V
	oWLTT5Jw6cG+Bs1cWjdeMaF0hgT8/T+RUsSVohD5UcJfY+OJzqCplNjmYywvzYRiu72IsuqzsrgJ6
	isBTpyDrAtXkMn0YUKdP/JXlJGEBvOk3jepItJ9h6RoZoIrIoKL4DRDTIdGAdrHYVAKUriVAZJkem
	dBX1euvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJFB-0000000HWl6-1Jhv;
	Mon, 09 Nov 2026 06:52:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJF7-0000000HWkR-1yAZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:52:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A02w3580985
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 06:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pYBX0T5CKcwvZAIN9tNQTOFk
	9tmHNlr1/FpalyNCLYA=; b=gINNI1pHW9CSMWKrDmmWyRmeTudBSCkqi6vz95iH
	CRika5aaeka7jG5OOoGFPXtdQFmIcC5vYetU2L4Aj8gwCYWVkt9r3QWMlza+b4mn
	xUJcHJxK4om9TzDnULvhndId7yWE50tfZo0famGN0tZUQIyjqe82BHN9rXW5Epd3
	0XlFslXaen/RANdzKp2kcaj7oo3fjemoQj+aNXgvUGItUmSBokbB6+za/REnINHD
	npfpBU9CW212d4OC3H65KSYhZmFlAsFr24dK3dwNpU4vGTgE6aBVBS1ixrmGwZqn
	RKEugSn4HljBltNWyJKO/fMQUqSh0FPMrO0j7yHCh2P9+g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv73521w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 06:52:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so703945eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794207156; x=1794811956; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=WK19HVy94zJ0S5KHQD85JS5btX1NRrAjbdxEciDqe4MY7lLF965Tz3o8OYwf4kWWJ2
         gx6BlFYhazkPf8aOemKe5J1o7lgV3cakn6P19ZRR+hwMRo8s6UDTFmp30cg+VXAqlKWr
         0qmZRkSjbP471Idb9FF12ooepa0b276rgxaslMvbdEHsPR6Wc8Kyu+erXwDyP7EXXEbq
         oYGckCu2KqscOTA+hBJ1LNlIZNdQ2Mm4x0lvSyjQlb7Xw8MWs+daK9zAnO7uqzD1jciS
         WHQ0GKYKrvxdVsx0XihgCs0p3Iqk27qfsgjg2Tuos/S7I3JG162CccYVL7bLNn7bI3b0
         Efmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207156; x=1794811956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=a/GxHtWs4kTuE8ol+S2LHTE4O1xqma94jvhcvf0Wt6WbvLTptPKjti9BkjWJqT1oP+
         A+GAjW4MaNn/4mOafdwIufBpj1ns7lR0fU+FZcLL77OYC2mX+nLBmQ4FYRB5geIkOgWy
         SiTUUkLRHPndBtRdtB83R9pGeHGSU+EWiL7knbp0szXnYEKWEY8fADIeMUs0ZMBrDkJd
         /fvi9YklsoeyuRicvz0pGSs0V5mXJ38s0ijIf6LTNU+NWByKrMGmnuiuHOsqDlrrzRt9
         nMB2eHsQ/wR3PWTySYscQzerxjcf3+T3SizbXhH7V1kQs77GeQpxPeqCONUzc9RSiMn7
         MgrQ==
X-Forwarded-Encrypted: i=1; AL+hErF19s4UGB/Rdw3Qx6ebkIJKilPw5P+5wntoso9N3R3e+oWgO/LwLmQx6ChJYSpqjuhmg+7G86RkhvDgPWD5h4Y8@lists.infradead.org
X-Gm-Message-State: APuU4Z/X3QY2Oo/hwsbc/ZDhF0y99s4Xu6pr+Gr+0UKf/GqT1OfaYpyd
	39nr7bWa6tIujN3fkaAHRgmFi2OD1oYZwSe7jMgBRNJUUjRX3zNGJaGpheTwfpYVV62FqiUKKIF
	+ddc6xpf4P0MdR5wz5P4dzLvDcZdSfMiSjZsNNr1Z9pGSXehA/k1ZNokpFP5nJp3zFDyelE5kXV
	WFtg==
X-Gm-Gg: AYBFou13AX8pUTrDbmeKlsGaYLZla0P+rXC1tc+eMzzQ++/6DNUX/t2aRCq/dOEi4Td
	tR+PsMUY74htHQL170E1dFIiK1bnop6iv9tK7QnF3XqHNLuCdpQBLaGCPg/vYOXYR9EGRNdOxiy
	GwH2g3KcBSp/r3uPG0YqaXVqEHHqxEmMa+PJOiTW79DFOUXBD02wVLXQN+d0859RXEJ90/js47H
	ZBeBoHk0BSPLNZl/0s4u/DYBKqs6fa+HnAJpHwXdcW8eISaVgvA0+RO76ZU/6b6Sznrn97wYpYN
	LyBXWJtIVzkdeFEDyRQXetnY5RkgNeMEtDdJrI+MQ00SJ3VtSI1qPzZ6mvkY9+xob4e+fzHc4Yt
	31wh9OFscTgZh4GkK5sbg0Lo6AS+hRMWjd81YREfrZoNmmodmawlWz+QTtqCjSL17CTWEIkMWGQ
	rkAb0=
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850905eec.18.1794207155640;
        Sun, 08 Nov 2026 22:52:35 -0800 (PST)
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850874eec.18.1794207154898;
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm10502754eec.17.2026.11.08.22.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Date: Mon, 9 Nov 2026 12:22:27 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Message-ID: <avFtq61Hwzjk2f7n@hu-anantiwa-hyd.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
 <au_BvH0rEKpgTpc3@zenbook>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au_BvH0rEKpgTpc3@zenbook>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfXxCaBH2HB5qg+
 Fi63nU068okq1XX3Y+SwLiETvvw6cfB27/dVppU1yY6adLsL2slFXG4510q4mSz3JVnKm9uGpZe
 TxtMRQlB2Z0je2jjvbAon3kxJK8pp+o7BS4mylY8r91vOXW16cEGXJVFp978IMvUCTvD6Qc055c
 Ae/vP9L/oKBcmkgFhnauZd1yQWI1Nh0srAL0gQtmbnyTpobh00+4U28K+LwHFzwc1dbrTdm8csL
 ewJxr6j37bG434NH7Gq6qryXI8Aw64xghm2ebekUGZwtd+Z7In1hTYeTSflnlPUxXSTto97jHcn
 zmWDwGQRdcao0fRGZkGcw3766kyp+Eoq0N4QCNttV5v9ELzBydRw27wM4jxPOgKF2Alr1MT9LJy
 7VFcyCswyg0J+yf4kSf0+2tnesLT4crcbFF4Ii18hurgj+20GHT2W7vK9WLvW3NEBJUDjKQddbN
 ED+90yMvZb3tHnyU9zg==
X-Proofpoint-ORIG-GUID: kXTIkFbFIpteurYatNAfTXs6Pfb7NjdN
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af16db4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=YaO7I9Z_RSUIAtd64XYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX5LvctzXvHl1G
 VvphTkVyoXuTI9Zu7JaJ+WYPWXSqprMSEjJiOH789dhRUGitJZOIMhFH9T9Egcw2aHZF/j5JhMp
 0uli3R1HIH7hDdWfkEZgrMMCdvGiXYk=
X-Proofpoint-GUID: kXTIkFbFIpteurYatNAfTXs6Pfb7NjdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_225237_509075_DE0CF920 
X-CRM114-Status: GOOD (  32.05  )
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

On Sat, Nov 07, 2026 at 06:29:41PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 02, 2026 at 01:01:30PM +0530, anand.tiwari@oss.qualcomm.com wrote:
> > Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
> > The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
> > connector, through a MUX which can be selected by a hardware DIP
> > switch. There are multiple daughter cards designed that can be
> > connected to this B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> >   - DSI-to-HDMI using the LT9611UXD daughter card
> > 
> > Below overlay DTs are added for additional display configurations:
> >   - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
> >     daughter card
> >   - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
> >     panel with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
> >     with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
> >     Lyra with LVDS daughter card
> > 
> > These overlays are applied on top of the corresponding base board
> > DTBs.
> > Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/
> > 
> > Dependencies:
> > https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
> 
> This was rejected 3 weeks ago, so sending this series wasted both your
> and my time.
> 
> Regards,
> Bjorn

Thanks Bjorn for letting me know. I missed that the dependency had been 
rejected. I will resend this series after acceptance of dependencies

> 
> > https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
> > https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
> > 
> > DT bindings:
> > https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/
> > 
> > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Added GP CLK Frequency Dependencies
> > - Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
> > to ascending GPIO number.
> > - Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Fold in the hdmi_connector port remote-endpoint indentation fix.
> > - Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
> >   patch; the dt-bindings dependency is now declared as a series
> >   prerequisite (see base-commit/prerequisite info below).
> > - Drop default-on from the DLC0697 backlight node.
> > - Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
> >   panel overlay to fix a dtbs_check "too short" binding failure.
> > - Reword the PWM_CLK defconfig commit message to name Qualcomm as
> >   the SoC vendor.
> > - Remove a stray blank line and non-ASCII characters from the AUO
> >   LVDS panel overlay.
> > - Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com
> > 
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Abel Vesa <abelvesa@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-rpi-kernel@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > ---
> > Anand Tiwari (2):
> >       arm64: defconfig: Enable PWM_CLK for backlight PWM support
> >       arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay
> > 
> > Mohit Dsor (1):
> >       arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support
> > 
> > Shashank Maurya (3):
> >       arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
> >  .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
> >  .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
> >  .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
> >  .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
> >  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
> >  arch/arm64/configs/defconfig                       |   1 +
> >  7 files changed, 493 insertions(+)
> > ---
> > base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
> > change-id: 20261019-lyra-display-upstream-post-24656268a902
> > prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
> > prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
> > prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
> > prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
> > prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
> > prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
> > prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
> > prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
> > prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061
> > 
> > Best regards,
> > --  
> > Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > 

