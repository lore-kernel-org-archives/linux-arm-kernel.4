Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F772606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cd2y9tz5;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pLruQmzb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LWdk4EdM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P6PGMZFxc6UhpNPssneEJ0B1sY5J1KKjecVwvvRM188=; b=cd2y9tz5YlB9kWZlYRJj0wreVk
	f8xxrxJvTKYIYiw/XqZbyaH88Jn82fgl/t781DHjSzErJqieq+L5sXewwU2snQ9ZtyeWIDPdFIixH
	i1BlQSY6ZvuIMU0y+vqasYNaWSG+cNEFCFX2J51L4bVqCYoMWYaACkEtM2F28VP6LLZp9M5U7DGJB
	mBFSGrEKZW62QkSiO5oRck8RLnFtqUGzHxg0KdOH3dmIb8GWiDUISK0fnFeOjJYSPSK5rnbjBug8Z
	7vBS7s9KXJwJMCdmgauR6fEhvDbg+ZC5gyVJ8S+4KEmpUO1MUvK1rgAwUKpWuQDVVPGccvYWgSxL9
	5pc8WneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmxK-0000000C8nz-0H6v;
	Fri, 13 Nov 2026 08:48:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmx4-0000000C8iR-02iw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:48:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VJib2515649
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P6PGMZFxc6UhpNPssneEJ0B1
	sY5J1KKjecVwvvRM188=; b=pLruQmzbk64QqOwvEb8+G4xkq5jhWCxdWZPr0xhI
	WIQPs0PLzldrHLuiBnylPRHumzBXeSdxxAzx2p9PmUCK3kiDSZCkbwCfzQW2W53R
	0YCPCGHhc9JuUlguBcuc3K0UduB0b9uy+7cTcc7Q8KgXDMwFnkUSKQZlVyKogDB5
	xLqUeWjAzpDzjqeCOA/DuX97Cb+jgpOy0FVHrPUm6HP8J+bapHiWSJ2Lk3ssi4+m
	UouEmDn0Ol3UnT+55MQX9DGVzp7EhRWck/3FzJirTYo9hY27E1JnuPgf/aGgSlpd
	XIl4RHm3JzOI9PYuImUhdD4SLntCCItuiPSek9DlJGF96g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bb9vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:48:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91e8badc80fso12102966d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559684; x=1795164484; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P6PGMZFxc6UhpNPssneEJ0B1sY5J1KKjecVwvvRM188=;
        b=LWdk4EdMewWfvMn5taHTFJQekj6MXecmjtpC63utTCEHvyE/zLUGAcRsvg+ESKwE1C
         g8zigrmbNOjZHNmB+gaXHFbWSsjjrPZg0bXZBtXOC482Eevd7NKK8jchSKTt97PniKtH
         QrMC5FCSd97d6230HNIddv/U1Pj2kiusR4K1SjhVGrSdpYvF414q83rL+kSfWJ4oN2DY
         Uj8ilO+wSQk1OnFhXtaGpNzm7EL309uP0CTT3XzystmmtNu8ihZgiPENyvJTpC2n2RRJ
         2tABbql1MKgqubSkfx8Si5Jcx7HtDbMJDtt66YXFCXKG9B7AAeXjE8jLJNQOPqu7+QFB
         2n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559684; x=1795164484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6PGMZFxc6UhpNPssneEJ0B1sY5J1KKjecVwvvRM188=;
        b=oKL+3qqiInIMkq3ROnJLNSbTj2OmMg2q73WkZnUbIa93OvKSUNPqSuWcTlTzFIIJW8
         G5gJg3Peh4c5atV8xGAJ0WiMWR43Fl49fYCroTcHvQikAsi6F+eud3aKx9tK3UbhIVN3
         bNaFsKuZda5FgmdobmCOvS0SvAcyRYBT2sOfTpxcL0qZ6xcJWiDF7tHPrr9x7qylJ8JW
         mBXjpH/a+XhNSFFNKbAWGTBDrDQLsEw/c+4kwDFaixKYcycnRfQfYQOzVx2SQgE1sXqN
         SYMZkQ2naDp+AWcHQumWRTn0uqxtNIyEp+pBu/1unrqWfTT89pEFqc0erCHI7k9+tQiX
         J4Hw==
X-Forwarded-Encrypted: i=1; AL+hErHfTm12SYdeSrmogYitgCyNdA48IZtJInMVUWzhQTUZ10sD8Pjf40LAWkP+fPTQHlXqHVuGb6plvZSR0zifOE0R@lists.infradead.org
X-Gm-Message-State: APuU4Z8T7vk46pVu/ffWSF5+60TS6mWDxWAOAepEr3yO/n3i/Z3OvLQ7
	6/srEKWNNg7UNAC7UEIoQyey4reE94pSprFdz0j05Qelo8MRTl6TVKMZ7MpXwq9x5MhbBXyOVUP
	T5jdnfoD2rg9M/ByWaioLfDtjj2uvuuhgukdsqrKIRS9978my3AsR171WFNh6vUERsM81SRLQta
	M0teszbALwWw==
X-Gm-Gg: AYBFou0qJLSgNlfCThTz1lmCvp7//1SvVkAs69gpncaGqB/lONQJW/5g08dnKd5UAi2
	iI3pZLmshcjvf/5aIXrhAzod0WDNr1e9F4aTYTqp3gPf+UNgRE+W2CCd+mHz4WFiIncr8j8ECJD
	jCaj1xAtOPSa8pdpwchN3Mlcx5oztcf5cuigPEo+7eNzwi0T6/45+61zyyFfKp5M1hJzzfT9h5P
	NYeSqjFbOXfeDdYSOZvCevlVGHZt0K+CBELQS8t1AciMxrvFsHgmsOeEzjUzYwKsUEyW7KFUywf
	BkrxrmyYFkFdrp5Y7jplGXX7UpuaNV1Vtg2g4ljnu4Q6ilWQylDvqPBm2Qb1GIGBQ882He1ERnN
	vY8xdRIEDVAHNJ3eq/43W7Z4qeBWP7yM8vJL9mHjh6REIOotCapxX9ShId8Qi3Q==
X-Received: by 2002:a05:6214:5906:b0:91c:77ef:21f3 with SMTP id 6a1803df08f44-91f241e0909mr25559586d6.35.1794559684201;
        Fri, 13 Nov 2026 00:48:04 -0800 (PST)
X-Received: by 2002:a05:6214:5906:b0:91c:77ef:21f3 with SMTP id 6a1803df08f44-91f241e0909mr25559336d6.35.1794559683623;
        Fri, 13 Nov 2026 00:48:03 -0800 (PST)
Received: from localhost ([93.66.91.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60ca70a7sm3689140f8f.51.2026.11.13.00.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:48:02 -0800 (PST)
Date: Fri, 13 Nov 2026 09:48:01 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: re-base EST after PTP settime64
Message-ID: <avbOwepxkFf1F717@lore-desk>
References: <20261111-stmmac_set_time-est_lock-v1-1-da1554f233e6@oss.qualcomm.com>
 <ea9ae0f9-d373-4e97-b96b-3855c01100ee@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8vOlyl6HxoyVuXhq"
Content-Disposition: inline
In-Reply-To: <ea9ae0f9-d373-4e97-b96b-3855c01100ee@bootlin.com>
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6cec5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=vJIuTH4p0ATK6gluz4evpA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2dOafQFslBOt0hFCmmYA:9 a=CjuIK1q_8ugA:10 a=-1ZYPXEuWJ9im3w4qA0A:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 1BwIgd323VDnjWWckDTjk3SktGioFZKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX0yeEy67f+xn6
 Gv2AM6dDz3mYNuZX9FeEOtDRrMdO6JD3QlYeQnv3MMYrbqI7ddtiXHCFhKVz7yiW9V+LtlXSJT8
 MR48s4OU30MP9kRLTfeMx2ChDFyEfkdVn/08pOw4oyPxSxMSjBrz+3MukllCjrx2aufhTr7F5mj
 nwQ4TCNvAE7Uj2pccl6MNI27O3SXC00Vy/VWjZTBnQlYeN5+c268sKwGdarog9uVDus3mowm/O0
 ixxhfs38M69iOV74X7+dj+otBg/TJy1EqRh+A74rVUy/6ye18nXK7bKiwfHFKH0tcFBECWBko4r
 Npb62pe1/14EYjmf46lePfLuMh93COnhYP86mYrJFBkZTW3e9DOcSlu2Y8XTt9qL3r+gcL4ZE4x
 tYV95Ebs3cqXUp9Ab3kBhiSIjZAJvDGGU85sc0TwWzQla/ASE7TaTgnbsGBPD2U3SYMPhqLUoOW
 HpuPM5i8BfhxbtO4zfw==
X-Proofpoint-ORIG-GUID: 1BwIgd323VDnjWWckDTjk3SktGioFZKY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX9FFObNch4XZh
 tB8S4qhlucVSBxsTZvvUaQr+XtI+Eg7GmXIGFj9mCYR0JxULK82Rm8RccHcaCi31XFc794udfq6
 lGx44A63CPi+aNNiuIfgSXoTQFqn+Wg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_004806_142966_A3E1B262 
X-CRM114-Status: GOOD (  29.17  )
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

--8vOlyl6HxoyVuXhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 12, Maxime Chevallier wrote:
> Hi Lorenzo,
>=20
> On 11/11/26 10:54, Lorenzo Bianconi wrote:
> > stmmac_set_time() initializes the PTP clock through
> > stmmac_init_systime() (TSINIT) while holding only ptp_lock.  It neither
> > takes est_lock nor disables and re-bases EST around the step, unlike
> > stmmac_adjust_time(), which performs TSUPDT through
> > stmmac_adjust_systime() under est_lock.
> >=20
> > Both operations change the PHC system time, so both invalidate the
> > absolute EST base time.  With settime64, a concurrent
> > tc_taprio_configure() can read the pre-step clock through gettimex64()
> > and program EST with a base time that is already stale once TSINIT
> > lands.  Separately, a taprio offload installed before the clock_settime=
()
> > is never re-based and keeps running with its old base time until taprio
> > is reconfigured.
> >=20
> > Take est_lock for the whole disable/step/reprogram sequence, as
> > stmmac_adjust_time() does: disable EST before initializing the clock and
> > call __stmmac_setup_est() afterwards so the base time is recomputed from
> > the reserved taprio base time and the new clock.
> >=20
> > This keeps the established est_lock -> ptp_lock ordering:
> > stmmac_init_systime() only uses readl_poll_timeout_atomic() under
> > ptp_lock, and __stmmac_setup_est() takes ptp_lock through gettimex64().
> >=20
> > Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler =
API")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20
> This LGTM, the return values from stmmac_est_configure/__stmmac_setup_est=
 are=20
> ignored though, the [cl|s]ashiko gang may not like that.
>=20
> Besides one of the EST commands timing out, it seems unlikely though.

I used the same approach used in stmmac_adjust_time(). I guess we can update
both of them if required.

Regards,
Lorenzo

>=20
> Maxime
>=20
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index 31a66e855d6b..6370bdc6c58b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > @@ -129,10 +129,19 @@ static int stmmac_set_time(struct ptp_clock_info =
*ptp,
> >  	    container_of(ptp, struct stmmac_priv, ptp_clock_ops);
> >  	unsigned long flags;
> > =20
> > +	mutex_lock(&priv->est_lock);
> > +	if (priv->est && priv->est->enable)
> > +		stmmac_est_configure(priv, priv, priv->est,
> > +				     priv->plat->clk_ptp_rate, false);
> > +
> >  	write_lock_irqsave(&priv->ptp_lock, flags);
> >  	stmmac_init_systime(priv, priv->ptpaddr, ts->tv_sec, ts->tv_nsec);
> >  	write_unlock_irqrestore(&priv->ptp_lock, flags);
> > =20
> > +	if (priv->est && priv->est->enable)
> > +		__stmmac_setup_est(priv);
> > +	mutex_unlock(&priv->est_lock);
> > +
> >  	return 0;
> >  }
> > =20
> >=20
> > ---
> > base-commit: 22b7cb932c6a0f7566d41072be6956cb6c8af4e1
> > change-id: 20261111-stmmac_set_time-est_lock-f74f4ce678b7
> >=20
> > Best regards,
>=20

--8vOlyl6HxoyVuXhq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavbOwQAKCRA6cBh0uS2t
rP9pAP0We69d9Ja/MXjMeW89Cr8mxmls0sCUfHoNch9W4wFTyQD+PQGPg/6xOrPm
7DwhYebqBdZ1m1ZFNeW4g5iWhoPSsgs=
=OVPM
-----END PGP SIGNATURE-----

--8vOlyl6HxoyVuXhq--

