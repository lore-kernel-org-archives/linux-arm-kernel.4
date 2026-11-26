Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61FD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zHK2FnIH;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JiNtauQU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kJi6V8rm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PqoyykxduRZqHh/+n1fjoPJ1dR9TtXkyxrARIp0l8l4=; b=zHK2FnIHoim8P5Ie+/TII8OMeJ
	BuNF/3YZhAWW7Xm/cBR6PygPSty9P5OD9fa0eQDcIcuMGmpXBQ+2vkqrP8j1ADIY4+6/HawbSZHP/
	mjfAw4FCmiABe7XOInsRB9OJOif/YbK6KwpQsr6kQDZnwerF3gePYBLWjklaI6uI3jDPUjyQcYFuH
	4i5UlrMQn0B7NCoT9tpfJatBy0bA4rMU1NcXIf2m2UMfX0fNB4DDv2nPWL1K13XPAaVLwZk31H4s9
	CB5joJr1iCQAdbokmhkg1YQmTc6C+8NCmP9/Gkwy9EY16eY+KUjtPEaAV8yVFBuX17jTletmWeSyU
	Mv4FzTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV9p-0000000CQuZ-1lD0;
	Thu, 26 Nov 2026 08:48:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV9n-0000000CQu3-2y3D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:48:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4DU2175787
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PqoyykxduRZqHh/+n1fjoPJ1
	dR9TtXkyxrARIp0l8l4=; b=JiNtauQUQFwzRoWkbgRJH8J+Bv91W4qwoISIePXT
	p0hjqPVm5pTANPXG1/jIR4SBuAIOK5onipHQxTcbkj1VI6q2dPJqjPMpiYAdcpcf
	PxKqNrVReayav0BAQuh8xVFCbRXhKHgikBMz8GPXZkHhCbXwizx2FSocWIf6tMgf
	FCawkgtnJFImef+KDyFs/sj5eZUiVTqyZdI7Vtgk25yAzKFc29onTwKJkzVbPq0T
	8t6YJq45NDFmLdu1T6NmM52zaMN6iQBrzlk/qzJfp99FeDZqJUUT1F+72C9RT+Qf
	AVTFc/LU1AvzHccFxXnD98ye4rBp0zVfSZq2lGMnq0D63Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahujtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:48:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so962714385a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682922; x=1796287722; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqoyykxduRZqHh/+n1fjoPJ1dR9TtXkyxrARIp0l8l4=;
        b=kJi6V8rmrZmVEIzGXvhIx3PEr7/24r9tDDxce1PD0cS6QrjJGJ44Jox9yBNLNGXCaD
         2FYcP96iAyF6ga/+wdgzUX+C+ztrGmq2kgVqGol5Yq6j0SmQosv3JjBZYOujVTcQ1m2F
         OhdtJXkWpl/YbbvoFrRdMbT9R1LX7254ryneNeUBJjPFjjO8FYwJciPavlMBwvp8Fyc+
         QMtTPTKbIAHOvQ5sfkH0bogwiraG9tY7qjvvER6dPSAuj5qxJ6A++yZHi5XvaXmTrQb0
         f7HZE1LrHkdRwrOX+qn03EAfHC6eQZJ/dqaZDAcYHk3NhxaLGTH8bbi6vC9K2RVrJzf5
         49wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682922; x=1796287722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqoyykxduRZqHh/+n1fjoPJ1dR9TtXkyxrARIp0l8l4=;
        b=e3IydgWRit6KLD4Sq5FCin4OmpNFcr/IdVyT2tf2qNTxRv5OjRrw4KLg7aw/l39d1q
         dF5GqmKR47P66UCh4ktXTFWWSF/zzEX6Pmtpfe/XAKQvrUcbRyQLqnDbMbOtejoTHQDM
         m3FFiQoW0Omw4muG/EbqX+ldd6qECw7ls5abplRv/mFDn3CBgnXN4rl9Kd7T1ng/KETh
         3QgtF+wGt9i2nAx2Z46BO0TQhToDOLHg+gwxfeuY1hSqcqINO4VCOsQjdeAzpRpZyCtl
         jbLkAV8PlLG4zefVlDmk4UbigoZIVZlGSOUPRFQeVWjBoR6uoM7pbpublJECX/kWx5jg
         UtNQ==
X-Forwarded-Encrypted: i=1; AL+hErG6P7N4lMfEKJPd3UlvRt/zb/hjpwIBJgzhKZgcvD1uo9xb29QxefXtr2Uum5NJtUtilkyR3ygDj/tEH+yuZ2S0@lists.infradead.org
X-Gm-Message-State: APuU4Z9AVv9yxHyuLXvbu3vKOws9AGL14l9Hi3xCzdWdROJM48bKa1ZW
	QvylCKn4g2ozB2f2MfT7kBPu6EA+6ws4BV+/rkf5fbGg65oImGXeTgUvxNh+fe+V3F346Z45i4V
	qABImYNIPHvHNCQQPvOV2j405WFdkIbaL9WBEx4MOHHBAsGrJTNWDh5pW6fPhUNVPFlnMWS/4xW
	XC6w==
X-Gm-Gg: AZFdTZfKQ3s8X9fbFf/WVDs7Bs586CkxReBdGVKZf8wE0/1zqFHnojGJo8UUORogZsm
	W7kcBIyIEeCRAQGO61N/7MBwJLb4EIRbOUpYkX6C9x2QZKv+1h1HJXZlJjTTxxEo/Xi/su9OikQ
	crtBi9nLrTeIfmScjMPMIT14azbskjIWyDuN9x2b1RkS7TqlgxZHuv9Dsn9pOwo3ZCwJUYslSkK
	KmnuNk9Hw1mWFfuzYzBOaVMdeB3loWP7qFWxOnt1HT2gqp5Hq2a1RwtXv4GBMdZQ9U+TTmqRvem
	ygSU+mHdT7J1XtrC75OtoHvjg1yiWGsm4+APoJKxBFJlDHDrkMH3EWFKDRRUDWXrHL2WG0M/82I
	cB0NTv4mQ1kmfVcnW/qt1i/JkBbofjMPeAzNHrsFeaGcSJXFSvQofW8LAx2xd6ldFY5qx9JJ5zn
	jEw5FhpZPHOlLPeo3kag/u3mb09TA=
X-Received: by 2002:a05:620a:4722:b0:93f:5ab9:fda7 with SMTP id af79cd13be357-949bab13ec8mr3826736885a.42.1795682922026;
        Thu, 26 Nov 2026 00:48:42 -0800 (PST)
X-Received: by 2002:a05:620a:4722:b0:93f:5ab9:fda7 with SMTP id af79cd13be357-949bab13ec8mr3826734185a.42.1795682921501;
        Thu, 26 Nov 2026 00:48:41 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm486755395e9.9.2026.11.26.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:48:40 -0800 (PST)
Date: Thu, 26 Nov 2026 09:48:39 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>,
        Simon Horman <horms@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        Emil Tsalapatis <emil@etsalapatis.com>,
        Ihor Solodrai <ihor.solodrai@linux.dev>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Peilin He <he.peilin@zte.com.cn>, Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net-next v13 0/5] net: stmmac: introduce XDP rx
 multi-buff support
Message-ID: <awfyZw_KPtBbL4Hv@lore-desk>
References: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
 <179561841924.3294.5101937008242312303@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="21Ds69qcq4+cHuSi"
Content-Disposition: inline
In-Reply-To: <179561841924.3294.5101937008242312303@kernel.org>
X-Proofpoint-GUID: dVc2rgmF1ZaDJC1hIXNbrUszVQwvqU5M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfXzw/Sz0w2cDe2
 bWQmntTwRN1ZWETB2cIxLbvkRdhWqzcDl/5dQOP3Op57ShGHrZ9cVLrx6XGXb0jJq+X3LCc3g0y
 F60b0TVKFCzWNHE02gqoy1wcJ88psp4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX7IFklhPRlMiV
 YXwnScYq0svW9sez7JGHeHsCPMYmlDCiphYHqwlIeRUJuMPDf5oJB5Vbe00shZOC0VBeXjRbGHD
 OgB3pSRiD/MENZeBmmmJUEMC4WEtO6f7rILrDEAkpdXZVDhMjr50XsidhifHmYdYnwEUtzjCdgP
 5m0K5l0yiklHgMvEZpt1GY5j3/YVmI+uoksRPFb+QE9fgeqPUd8MToeqeeIyE04gTN69my1enTN
 UdoToj0u1JtBpRL7G/rgzUblqIn3zyi+1ZSrwL5A2eE0orDWtnBLaJe9uTMMAE7LrzfzplqJgQc
 1bFccvQBahJl5AE2JZrAGyduV06P2cO7srsF9hxGs8Kpub5WsBbgmiO404W0GgzgrypPyVSPtXM
 PoHbjICk4B/5Ji8WCgTW1XrwUc7JHjD04/B7nPqvRD6rTKrqdHMBBtMUvkvdzM1DosiBduEGyRn
 5RrN5IRHgjFo2Zv1pig==
X-Proofpoint-ORIG-GUID: dVc2rgmF1ZaDJC1hIXNbrUszVQwvqU5M
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07f26b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=njfGP3QAHdpSEUKGj5kA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_004843_754137_FCFF83B6 
X-CRM114-Status: GOOD (  24.55  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--21Ds69qcq4+cHuSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issue has been discovered during code development.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

This is a theoretical issue spotted during code development.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested this patch using a Qualcomm rb3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>=20
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--21Ds69qcq4+cHuSi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawfyZwAKCRA6cBh0uS2t
rEunAQD6nl/VLCn+I8bSqRZkXf09LIErn40/UwJE7r4eCWDJDAD/VfwnrMJKYCca
oaGdT3AhfeLSpSBeDENyGX4j0s2yPAo=
=Ssfi
-----END PGP SIGNATURE-----

--21Ds69qcq4+cHuSi--

