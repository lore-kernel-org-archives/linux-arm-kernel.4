Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7360A2602
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HD1xWGY0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=L96pAvYf;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KkfEYeTI;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BSKlRuUG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=; b=HD1xWGY02iUAEY
	YgXeaST7C7xOk5ZHj7QvMI2F65KIWa3IPrw/wNxfOok248LUclKwTXSuLTIhsBj4y2/2eebZRVwpf
	/uxYKM/Z3c6U31AVHrVb7JUdUtOr0dnsXjRIWFlbD69eoeZejJ9u7t5Q+b+RjoB3tXH7aH/0SUVpJ
	+NHLC5/trnuti3dkrwV8iaEXBCy9JnAIqtBdIIgynRQJ2pBaPd0pMJlvjbh50nRtEo3uKUDzOCMgp
	52WF+fMwz6zhYNZe3C+GBU7JZ77Ueh1eyLRY03SlbyqyEQC9ggrR+0C4wJdAD+s9s2OuEdfbw2Uk6
	cD6R2c9VTDNuJlQGTmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvOJ-0000000Dn8N-1xu4;
	Fri, 13 Nov 2026 17:48:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvO6-0000000Dn1s-0WL4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 17:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=; b=L96pAvYfnQXKumDstv3F9JAj+8
	4jTJouxjEP72v0LTFVBw1UEobFjbjdrJnlGYZ/4BI4DHCJ8ixbMfIEM63DAmdlLboObMv7U3a/2Rk
	5whyYLe0zrx+cXdah1T3GBJNY4xmRUPZJR3SFixrebPDy4EZ/Tk5ldt5olSba5PBsp8ci1MpOjtIA
	LKC/g5jmDdTAUmaoilAacN3O0NtOgjJm7cVwWy/3KYchfZHNhJ7NMW/ur8Fxzu9etVVnUY4oi58ts
	A9PFYIoDxEPVnAm17mVulz02sUXKHsnMzBvae0BStpmEzU9wSdYjaJdBIxnHPYEokLlo5H4zyM56s
	FGqLQviQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvO3-0000000Bc1J-28tu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:48:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXJCL2808704
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=; b=KkfEYeTI9lRmQdLe
	fqlpoX65pQrVvp9pbgz/9IcgLUM7nN14d9AkwYPEi5PpQKUoSZNODD7Tm3HpEFAH
	2PgmaV4ipL/vczkEMqV6E2lXPISjloHIcJ2JNdt1IODzvMRzVjvtGf/sLvhtq+R1
	WkFgN13QpDuKn6c/Y7yqxZNdpAYHmrfJ3hzVrXxl6ehpMJvw7OjyLua1/SAAMYCY
	9tVGYPeV7d2pgKeKaT+f33fb6aSh4gHP5zyLnpjtPjOYxo6b3U4bA1AHy9unJg+G
	KIcLkqD850a4nhIsk8xGv2p97sO7YbW9UL6VZGgT2mgbJcK5fCvFrcj6Cu/ChQpX
	vumXrw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662r8e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:48:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so2229876a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592109; cv=none;
        d=google.com; s=arc-20260327;
        b=emUyx8jpr4rXuAsMR3JgzK1XEdxP6cSqWt9lKAEUkyajp2fN9K7MzQmmlX2AYseTUn
         imAVJhQuhs84pd7eiEC+UqNKPlqTWZHX2vpXuHFc4MShTFVth+OJYmhsVHLFQjjtFgeP
         lwb6PIQGxhxYxPNkzC5urxNejE6ywDU2GW7IamgfDukTGYDR3nvZ++qc5qQmyOLy4CMW
         IbGTFTuJvBtQ+v5GAgvvU0d08fce872y7KJiuXC92mK7BO5XJW0ppbgETDwNZzdAWu12
         qif04KpqApXEUFre2AHFS2YFVWda6GW2EFWFc6Ax9eU+DZaVsZ657MikP/cknNsL9gji
         iluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=;
        fh=o/WUK3knhW7maxyM08Rpd5Hi32NyBadTEtWtCH4pKAs=;
        b=Q3xO2tVaBdoGj4bObonxP6azgKyjMOlSJNdEVTTi9WLDi37Q8xpY1PFxN5+r7Qiia2
         0RmPdACGnBW5GNLpLWXr0kiY/R39W4oqWynBsFc/JRgRtSAmqtZ0oqa00vUtdnA4/K2m
         /9rj00APjOZm4X9dMzCEwvPVOlprvpzmpnnmRGbbi9r0q0geRqaga1XtwK/amnPpmm33
         tmN7PENVbFp+jZNuotbgPUMX+zlEXiUXKNjh3+yvHJu0kUp46oYqSbDs4TFUHbu/A5Cr
         PhttMFRIUZxY0NlThFFWXUuGLBMgxDEqHF5BoeKoZkoC0wzC4MEdhvHYSN34zHmCGTDq
         r17Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592109; x=1795196909; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=;
        b=BSKlRuUG0Ph3rGal2aDVjc1XNMZSili4Yu9r9hoCK8zHrz08Sc3uTRYFt0OvUQ8nNS
         QMjuqzBwdFMp+6VJTP6tBdlOT/EhkWiyjNwazVdRd8osCaQPOmlqgMbc/4S1+tOubOG4
         WNZjow9A0HHn1bN/pjzI0UmBtf2SFloJTzw8x96RRGMEmyQWFrvHYAT8+kxl/xhiDn6F
         NQKAZbzVJGW996bHUhFLrDrVQiWE5iFSjvskOj1llzVtK76ilojcZpzbbVTq0v/CQL4N
         FZgRbJBoBRmNrUuZnOBqyIFygkHRIoZsz0I5bDaAECmR/9YGmUSmHNDoU7ny9xTka45S
         kyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592109; x=1795196909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXFTYTHJxfVh03mXC0hFzyo52/qWvEBt2PQzkOclsuU=;
        b=Ywvq8eOkFNPp8IRp87Px33hf2q51RK3WUOvjSet/VbW83nRpWZSA9G3o7jSRkKPq8a
         y+IvXvaWo1zaR3tZQ1Essjihdg2xZYmOT8uIetWWTn7IVTw/AvQkCPXhdJnM7ozSvawF
         IrKw2HLmv9jBI4C2/aaBWaH56mMPGkFzU4gUujdjcnEBBtxuit3ShHP643XQU2Caoicx
         ESvi4OJ0k5EMoh4yJ7F7mPuxxdc0MuMK/bE5HQuCEZTnXgQsAVOc48IsGWHP19PQhkks
         i2mPlnl9cA7wh+9mu3d4Vjdu6/6uHnC1SvGUk9SNI5az+dgkU0aAAMbT4/lrbzd67sbr
         A+5w==
X-Forwarded-Encrypted: i=1; AL+hErGgxNrBVpPLz3w7U0mdQRz202BwyxPLVba/Wdf3kexsbwiu8D2HM1l/NyFJCQK8EFEVKGEdcHMtddwJshEK4CmJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+x7ZORaEaSsb+XBtZlPgzooGgYHxMuYSivZ+IlPDSN1LbqJYPe
	AwUqDfqAutFdrhNeoqMwA00Djuymisy8kQJ6oL+qrrYjFgpO8HKqPVNKeFlulkJ+6cPcK35w2Qq
	GACDzkSII7pELn8TegQ+UhrbyyPfaMrRJNWdGAtxv7q7NxDVrnYOmRVIos/nmnvsLMs4Lz6tc+r
	ZsVsIpGCIvHSug4l+H+fOBESI5V8iq940e2qD7atubqCG/Wfs8IdY4
X-Gm-Gg: AYBFou2WnuisWFlAqtuP0RtaWKOqvb7JJ2veRx/hO30fMb3AREenQtpySqmXne9FgfF
	P5RVxr7BWLpJhAF7Xg85Vhnbs0+T4T7aT9C6uHILnlfqCmG5lNUJrBnlsZrdNK0k4BE4wwrOpuZ
	HXeGC9GLwb4GkseARlpJE3+m2tGGmJBPt7C9geqkH+fdqrsqWqfYEchTLvTA==
X-Received: by 2002:a17:90b:48c9:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b1b0cf38ffmr3470949a91.49.1794592108609;
        Fri, 13 Nov 2026 09:48:28 -0800 (PST)
X-Received: by 2002:a17:90b:48c9:b0:3ab:f2a9:cacd with SMTP id
 98e67ed59e1d1-3b1b0cf38ffmr3470918a91.49.1794592107986; Fri, 13 Nov 2026
 09:48:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
In-Reply-To: <20261020-cpuidle-defer-v1-1-c86e0d450b4f@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:17 +0100
X-Gm-Features: AclHuK9kfYky7mkn_GcNiHozG1zO-1rp4kEjZJ3xhZTmPTd2IODzmeeVV_jJyfg
Message-ID: <CAPx+jO-EkVSELG9L36ZTj6ZdeAJFTiN5L7voxCFrDN-w_GrtSA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Do not log probe deferral as an error
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: f3gls_BTWDnkuM4NnUf1WLdbsUb56imd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX1+or0jUR1RMZ
 bLcGlr9brYEtN7oofSOkgMJVwzFhtBW4TvcvEp/SDsWpc/DM2CmwwopBhbmYoZeq7IYVaIsJc/H
 agMBrnCCR7NXEWBUdjJXDcldf9Tljp4WvHTQ7lyNbkRwxJWB30CDUf65C6iHQZN+QE1if/P3jv/
 tkCaF0z+C0bayfQwxI+FCApM9PHxzcpJrDTPGK1YGgw8dbB0xtHnQeiyTb6F3Hn0D2dB0gAcXfm
 GovXSfUHHSRRKscNA3HxE9yCT9WDmatB4jHgbIkU+Y6Qs8NzGTOIHhQmZZt+yd6TfFCpTGt8gWa
 6j72yamHTjT7e8b65BgTuQupg7heBq6KwdpU1jpBHLQypHLdiuUBiPUi/rdVrb+WVv/5ep06950
 I3IUfI63SHXYRrIHAhnNGEznk+/KKs6vFKf0o3BvWR45KFsiZ+EThmhC0enBmB0itd5F9in05lv
 6RabwUGyzGgUlRP+MnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXyVLEfRbki9nR
 yNeToCsFZRDL9TEqBU744Rf83DKlvC0QYbcY75vGQS43fcWMrBzZ642FcfwMUxGwS3ITXJnF5GB
 lPwmWynQmyJ3rdvF6HcXk+c2E3GdA+M=
X-Proofpoint-GUID: f3gls_BTWDnkuM4NnUf1WLdbsUb56imd
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af74d6d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=g6GHq2a1GYICSwjt_K4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_174831_668651_56C94B96 
X-CRM114-Status: GOOD (  21.60  )
X-Spam-Score: -0.9 (/)
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

On Tue, Oct 20, 2026 at 4:27=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> psci_cpuidle_domain_probe() reports every failure with pr_err(),
> including -EPROBE_DEFER. dt_idle_pd_init_topology() returns that
> whenever a parent domain is not registered yet, which is a normal and
> recoverable condition, so an otherwise successful boot still logs an
> error:
>
>   CPUidle PSCI: failed to create CPU PM domains ret=3D-517
>
> Report the failure with dev_err_probe() instead, which downgrade
> -EPROBE_DEFER to a debug message while still logging genuine errors.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3310a76ce62018dff0af1488e33d2..aa73a2fa14b3af4d1e3edd607=
e058ba96132bad7 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -173,8 +173,7 @@ static int psci_cpuidle_domain_probe(struct platform_=
device *pdev)
>         dt_idle_pd_remove_topology(np);
>         psci_pd_remove();
>  exit:
> -       pr_err("failed to create CPU PM domains ret=3D%d\n", ret);
> -       return ret;
> +       return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM do=
mains\n");
>  }
>
>  static struct platform_driver psci_cpuidle_domain_driver =3D {
>
> ---
> base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
> change-id: 20261020-cpuidle-defer-4e6184bef223
>
> Best regards,
> --
> Loic Poulain <loic.poulain@oss.qualcomm.com>
>

