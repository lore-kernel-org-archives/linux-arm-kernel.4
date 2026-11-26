Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4934D606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lq2PaXh6;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LN8w68kC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXvcJKXJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=; b=Lq2PaXh6gyaybT
	p/69A3xyGSbwGY9stq7nrh11pYZPjz8CtbuMIRGudPIymo4Ws+uIw4m8gNvZClU2RbMSCuj76TYMr
	QAhzxDoLiodHWYhiYn4TSjYknDkzhWRr93eO9XrSMo8stWR5sGJR8T867oDEIGvLp/+4ZcXg2Zezx
	UFTiNaBQAQ9F2YfZ74G9SY3YgQLdGZysqzL9WfjBLcsfvR1MDSRc5UE68VGAcE98C6FL4p7t8O32R
	ZOdAAk3c7W2RPmoTEaZXWv9zIi0HTu8VMujlTFAQQjy4NyNYKIqi4sSOUfS9zFXxjJ0h1aYxfS9w6
	zLmV7fVZSsx9tiEwEvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWch7-0000000Dy9L-0rMF;
	Thu, 26 Nov 2026 16:51:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWch4-0000000Dy8t-1kMh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:51:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuIMx3357425
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 16:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=; b=LN8w68kCprRpgF05
	kJDoNtvjfd4aAUxe9bIeSOxX88cccqH0S0YCVlika7aERAmDsO8j3AmIdt3eEbqV
	e+OKwkZNPHQ579sxl6c5y+7iQypvPsXf9R25964wlGy2noNoKhzruXSdor7sDVcJ
	JNnx38dYK3oc89yFYC9jnumXhtRoccPim6YC2Tnj03L3WXmr0IYMM+wStPc1L7ey
	suNC8+bvVwvs9qvsyyT1ddQzK5ux3eFleUZ37cmeuguxY0d358hTse4amoa8Kt2x
	NqsubbxpPW172KRqtootduOnp2JoCEewC+LbdOLwW8OQ2CrI3V3v1G35OOGqtf52
	X27YgQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbtkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 16:51:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b49dd1e77cso3840629a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:51:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795711892; cv=none;
        d=google.com; s=arc-20260327;
        b=M1/3MEXWN8I0ox7PUMt96AtvBRag1ce6kjVCAnDyJa8USaUEVikrsjEBvoczabAFZn
         K2xYm9NXl+SKi4+M0Zh+Vvk9HIm7QPCDXet7OTzbWYUmcSLz6wGaTvMgkO8Fisno8b5v
         t05PeiY3uzMyx3XVPdAHjbDG2TYE0Id6RRz0BOv/tmHuZvtkJozAj3uwaQLjkALAAH1b
         b7eA+pXy55anssO42z1Y35WDOE5WXGqgPc4Gi3mJkpyiyopm3s8OJ3SeQBUurFwixRQ3
         tqkPBo+9ME94KJCB4KN1JNznVi7OPl6c80WQghdpO5K4PPRDwwGGpkL74CK9BnfMjWBz
         Pbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=;
        fh=PrQpT3sSM405XNBCCzRcKuWcr/USLms0r2fYbbV/t/o=;
        b=jbVzuTjN5dHklUxB7Lzn2sSN9JNSf+LAZh2Pj7VBcBYYhaRZUEZ92jz0jCSqd8BIhX
         cxa8xrOsRJHV+y8iSY/6A0uui2EJ92R4FZnnnx6GnDTRRJRglvAzngy7A3EMK1f3QCHB
         Jt8MabB71ze39hYGArBGL3XFRR/FiHpMOd1glcEyaZKxUQwNJILOwTk07c7sHeOyYSrO
         93NAdDzAAyH/6hOdDmECmJDT5VpGhBselYeKodYesz8U99HZUxrTkcO6sJqkLicGGu2g
         8Xk8zqYM7DRqWhKBEU/sg5A1A2bkaHs7j4eFIc12FxmdsAWF/31C7WAB8zecewlKr81b
         q/0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795711892; x=1796316692; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=;
        b=gXvcJKXJx2hdFFfzUD3JvXjqbLkJ63g52gxIzD7RZrvjsfhJWvuQdynGQqtTPRJZ4l
         vkTdKt9hD6af7jPjiXJJnj5qcjiNFJ6eZHHez5dq11Y+a5mTBWFTlIs1ts7dC1TJs1P8
         wVedVXE16J6prDUd2IBoj4YIsK8NoSoNkVy2NtPBlth7UL+zenHcXAtxVZ+hT1/Q+QJ9
         rFPmpIwPg8Nit/KnuzfSrAbQwCdGdkQxGeCY1+VSUKD8Y4XeBBGIUCEK7HoTo5Iz8ZHv
         OqLtsG6GDV5QN6T2AlJPK45BOgqCjL/VnR0UYNclZ5TUnY8j1HLtCucSdKAVfntCzSpW
         a3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711892; x=1796316692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=;
        b=E58r9DD/RnGGE8zFl+MQ4Leh3TlAdKl7zDoRS4O6HP7mP6i3sWS+4fpKAciMUtjEvq
         yk300Qf5Eil0UKPb+hnrjHU82hHvNTSQrwPGpDpw0sc8g2/lFfj9opaP/4dSzGlBwymV
         f13pJjdIv3oOtJr5uL2Y+sR3VnxNcYBU4HU+iSweCpECIHr6Mvr7uTLRFFpBPC31rWef
         3RCDucfsTpZtRMn37VW262qn4OH0kjVDYihon8SbBuste/fufGZOW9EgPvyAQVu8I3kN
         RTnH8PhOYEuo8rNr5GnoHYVOB2CMbZ+w+4sqq4kt5rXqIKj/Xz30DNW3+14OVyNxHGY/
         nwJQ==
X-Forwarded-Encrypted: i=1; AL+hErF4nmulM91PP2G4zkAT0I9JhV7LgOsmzO1hHM4wTp6OQ/+ZjPxfbY7ww010/rGIGYBQ7Htt6N6nhwu7t4BLJQIK@lists.infradead.org
X-Gm-Message-State: APuU4Z+FnSUzcUEYgxdeRPXL8chqZaAQT7DZtouxVVpy7nn3CcNUDEAR
	9M6zh/k4wLj7xHHfS9Ra2qKSAasjuNquvN2fYyGwIE3HSlZwb++E5nLuIVQjhPs5UFYZwDzIznr
	E0DP0MO+lEWQzDb6NJ2mkVPqQBF3sBhLjYT4bP4Oq1sk/Gjyh29Hfs4hDKtXkf+1QEmGB0YpmL1
	mxjFQIkaS+9pOzEVA7kFvw7ZANM0dGb+knQGVu5jhAOpJHJBaad+rg
X-Gm-Gg: AZFdTZcyxLhVq7eKlsmq28OTWXz4f81chkSz61nBOSQvm5vpvkVIfUXjcys2wZiSXBc
	LrqKBICdS+VNZGW0iC7aUXutN1qsSv3t7ItNDbp8O8W+otzzLvXEAauT1a4B97GNH81N+KPVFRX
	AhnEF69eVEBVXwD5k0Em9Yf0pYvNJqCHfVFPM0S5jiy+I1UyFfeNf7mGC+2w==
X-Received: by 2002:a17:90b:50:b0:3b0:b35e:b373 with SMTP id 98e67ed59e1d1-3b41c7c2378mr21122811a91.4.1795711892239;
        Thu, 26 Nov 2026 08:51:32 -0800 (PST)
X-Received: by 2002:a17:90b:50:b0:3b0:b35e:b373 with SMTP id
 98e67ed59e1d1-3b41c7c2378mr21122785a91.4.1795711891756; Thu, 26 Nov 2026
 08:51:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-fix-resume-reset-v1-1-115b3da5764d@foss.st.com>
In-Reply-To: <20261113-fix-resume-reset-v1-1-115b3da5764d@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:51:18 +0100
X-Gm-Features: Aa3M54o4VHeMYCpg2TuAN6_-LjxGTu6SJHr08jR0_SBLE_JPiTPSxML96L7j05o
Message-ID: <CAPx+jO_V7f69HU+8r7thJW6xvUc75zsaWamHc9+L1Wsh8vyU6Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: stm32: reset and restore SDMMC state on system resume
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@nabladev.com>, linux-mmc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Tmi8S7GYmeZtlpUKa_hEa3YMEFc6razV
X-Proofpoint-GUID: Tmi8S7GYmeZtlpUKa_hEa3YMEFc6razV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX72bEYrvP2tbW
 iH0Nyc9VeT+gS5VzcKNE7wWhCRjl9wUCzDtT4ppCybHApGtXBDlAJ/vE+/jPbgOnvjVOTEwmq36
 FR2DOOBd9PQaOJdoM+4H121oMrzZLkc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX0UgLfYW4ubDF
 +RMYLrduS0WOlWZFfRAjASykZqY/5hCHMckA4SzYSeOxQNYfQQwhzjsfXc7bhTdWRHGkdleee5v
 1UboBnh/sxzEuTZzCV7VJiSckT4ytYBvCf3QV0SV/4/Im+Yl649yyHLW7mjAlSmFZNSQpJWys9p
 a8RrWZKOdOakf+WPb9BWzkAShlesBSm7JOTXmneD3muWD277gYsm8axaFL6C2HpW+aGS+QSKfGf
 EaRDVUUmLm8vXQ5lCQiQIcyYHE7Uk/un6gQdMTZpR9XdPJodlYoKE8RyH6BAc+Ud07sNsOhCKW0
 /FcN5sREr4Me+AiFcsZfEeVjvgdrmAwgvvZPMHNG4ADsSHSO0mrvgSjpKZJtSgNJFbJBKjpGrmA
 xe/NStDTaEPxA3DQY7hxUfN+xQl44pcn0MUz+q2D7Djeatn70QwkFTOH9qd+r0HwqO50Ed9kVZI
 7RbBw1jLv1T/MWWXksg==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b086395 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=ecHELK-FIlHdQtvxNqoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_085134_572895_F69A5B88 
X-CRM114-Status: GOOD (  36.22  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 5:36=E2=80=AFPM Christophe Kerello
<christophe.kerello@foss.st.com> wrote:
>
> On standby exit, the bootrom may reuse the SDMMC instance used as boot
> device, leaving the IP in a state not known by Linux.
>
> STM32 variants do not set pwrreg_nopower, so MMCICLOCK, MMCIDATACTRL and
> MMCIPOWER are neither saved nor restored by mmci_save()/mmci_restore():
> their content is expected to be retained by the hardware.
>
> Add a reset_on_resume variant flag. When set, and if the card is powered
> off and a reset line is available, reset the IP on system resume and
> restore the cached MMCICLOCK, MMCIDATACTRL and MMCIPOWER values.
>
> This is done from a .resume_noirq callback, so that mmci_irq() cannot run
> on a state left by the bootrom once device interrupts are re-enabled. It
> also runs before pm_runtime_force_resume(), which does not resume the
> device if it was already runtime suspended before system suspend. The
> clock is therefore enabled locally for the duration of the sequence.
> Clock and reset errors are reported to the PM core.
>
> Enable the flag for all STM32 SDMMC variants.
>
> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci.c | 58 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/mmc/host/mmci.h |  4 ++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 5ecb4d0bdaa5..f5affe4fe1b2 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -278,6 +278,7 @@ static struct variant_data variant_stm32_sdmmc =3D {
>         .busy_detect            =3D true,
>         .busy_detect_flag       =3D MCI_STM32_BUSYD0,
>         .busy_detect_mask       =3D MCI_STM32_BUSYD0ENDMASK,
> +       .reset_on_resume        =3D true,
>         .init                   =3D sdmmc_variant_init,
>  };
>
> @@ -307,6 +308,7 @@ static struct variant_data variant_stm32_sdmmcv2 =3D =
{
>         .busy_detect            =3D true,
>         .busy_detect_flag       =3D MCI_STM32_BUSYD0,
>         .busy_detect_mask       =3D MCI_STM32_BUSYD0ENDMASK,
> +       .reset_on_resume        =3D true,
>         .init                   =3D sdmmc_variant_init,
>  };
>
> @@ -336,6 +338,7 @@ static struct variant_data variant_stm32_sdmmcv3 =3D =
{
>         .busy_detect            =3D true,
>         .busy_detect_flag       =3D MCI_STM32_BUSYD0,
>         .busy_detect_mask       =3D MCI_STM32_BUSYD0ENDMASK,
> +       .reset_on_resume        =3D true,
>         .init                   =3D sdmmc_variant_init,
>  };
>
> @@ -2586,8 +2589,63 @@ static int mmci_runtime_resume(struct device *dev)
>         return 0;
>  }
>
> +static int mmci_reset_on_resume(struct mmci_host *host)
> +{
> +       struct device *dev =3D mmc_dev(host->mmc);
> +       unsigned long flags;
> +       int ret;
> +
> +       if (!host->variant->reset_on_resume || !host->rst ||
> +           host->mmc->ios.power_mode !=3D MMC_POWER_OFF)
> +               return 0;
> +
> +       ret =3D clk_prepare_enable(host->clk);
> +       if (ret) {
> +               dev_err(dev, "failed to enable clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D reset_control_assert(host->rst);
> +       if (ret) {
> +               dev_err(dev, "failed to assert reset: %d\n", ret);
> +               goto out;
> +       }
> +
> +       udelay(2);
> +
> +       ret =3D reset_control_deassert(host->rst);
> +       if (ret) {
> +               dev_err(dev, "failed to deassert reset: %d\n", ret);
> +               goto out;
> +       }
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       writel(host->clk_reg, host->base + MMCICLOCK);
> +       writel(host->datactrl_reg, host->base + MMCIDATACTRL);
> +       writel(host->pwr_reg, host->base + MMCIPOWER);
> +       mmci_reg_delay(host);
> +       spin_unlock_irqrestore(&host->lock, flags);
> +
> +out:
> +       clk_disable_unprepare(host->clk);
> +
> +       return ret;
> +}
> +
> +static int mmci_resume_noirq(struct device *dev)
> +{
> +       struct amba_device *adev =3D to_amba_device(dev);
> +       struct mmc_host *mmc =3D amba_get_drvdata(adev);
> +
> +       if (!mmc)
> +               return 0;
> +
> +       return mmci_reset_on_resume(mmc_priv(mmc));
> +}
> +
>  static const struct dev_pm_ops mmci_dev_pm_ops =3D {
>         SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_re=
sume)
> +       NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, mmci_resume_noirq)
>         RUNTIME_PM_OPS(mmci_runtime_suspend, mmci_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 4d3647f9ec06..3a053e40d113 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -334,6 +334,9 @@ enum mmci_busy_state {
>   * @supports_sdio_irq: allow SD I/O card to interrupt the host
>   * @stm32_idmabsize_mask: stm32 sdmmc idma buffer size.
>   * @dma_flow_controller: use peripheral as flow controller for DMA.
> + * @reset_on_resume: on system resume, if the card is powered off, reset=
 the
> + *                  IP and restore MMCICLOCK, MMCIDATACTRL and MMCIPOWER=
, as
> + *                  the IP may have been used by a bootloader or the boo=
trom.
>   */
>  struct variant_data {
>         unsigned int            clkreg;
> @@ -382,6 +385,7 @@ struct variant_data {
>         u32                     stm32_idmabsize_mask;
>         u32                     stm32_idmabsize_align;
>         bool                    dma_flow_controller;
> +       bool                    reset_on_resume;
>         void (*init)(struct mmci_host *host);
>  };
>
>
> ---
> base-commit: d2616724e01132376c78872b8324f38659af9f28
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git nex=
t
> change-id: 20261113-fix-resume-reset-9bb5714fd505
>
> Best regards,
> --
> Christophe Kerello <christophe.kerello@foss.st.com>
>

