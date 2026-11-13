Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C7606B235
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TRltv2jW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IG88cOgj;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZQAGIDG;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvQc/vtn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=; b=TRltv2jWUquekR
	n4jp+WQdgOnqI37qVYFF3so1+dT/939Up1/YytVqQ8wv2CzrIy7bOFiQ1FGaqiG/DrB3zjHJb8A7p
	zI4JBTSBxf7Mu+F26W2xt0oMZm9FYH4Z2a1JnJh6U2gxQk4XC/bgC0mLrDXwXSU5l+nmlmZvE3pCK
	dF2Zd/3Qgm9ejCwbAmtWb3GT0E3UEqZPfpAvzRKKyeE+LcXvQZ5zub1Aaf7tm+yOjM1zf/zyHXG+C
	anyP5fIxNQb3r2XNXi6ixltBhGinoMLf4qhz09ZJQR3N1YKgFdr728uAmJSojZHE2boJIDdPcvWn/
	4lvszYgx4hToAid2KE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNu-0000000Dmvf-04Mo;
	Fri, 13 Nov 2026 17:48:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNs-0000000Dmud-3N4j
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 17:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=; b=IG88cOgjAKK23W9aWD+Lh3mSsy
	5LSk+reBpOyA2iSbnKC/4Jp/6c9H5ycM8g7SCxZEdab5EqvvOK566bvKRVXuYOXxxfnRoQGd/t4Dw
	oOPdaUND08JBRXwXzckRj6PIy5hiNsp3j+393HrH06XqCl/3TGhMXhZe6y7B8TkjKXeZJ088qjioC
	o9PpKZK4wpsqObAiN6+mqgcbYryaFntqLmrs/ZBlMoEbOGLIPkPsytHolptaUmo6dm3Hz8xAEaLPk
	xC/rRXNa6+m1b88KpgXSbpDTawsrM7uOKK9cxOaxsU679z6z7+2TLzyf+34K2GhnyrhYEvuvL35xS
	ARhiHpIA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvNp-0000000Bc03-3dMK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:48:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXJJG2808709
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=; b=pZQAGIDGVwHJfm1U
	MPRN2QTFFZq/UoCWG9MIk42a8lV72+KURht33BDF/LLzZ8RbDEeCnHpX4mImRXw5
	7hiSMXWxX/ZkPLBH8jsisruy99Ohe8KaSz2EPlMvq0kS/clp0za10LhijLWRMbT7
	m2c+utU3ETt3e9v1otJKOBd5k+4PugjibRXwOW6HHHGBx+QszUay/gdkK7FukSgl
	anZLrFIlWejdBF3A3LG1wuoJVOR+8eGwYnumX69NNWASjv48oUqBX7HQnQohgniu
	hR2Eo1AVbhxYPLaK3x2vb7gRxffvUsNn7KdszpR+hlyzoOrN4zzeISkrhOhrD6E5
	z/FtkA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662r8d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 17:48:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1809157a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592092; cv=none;
        d=google.com; s=arc-20260327;
        b=RzNrNbgvQkrLG/onxLE3yTFm6idK8UVFnrJXl7K3tWV435J9fv5cPiFS/Ll3m+JCNd
         d/h4Gyv0KRv6muuKiAXJbi2UJyUCOn/9IGQf6TPROkq7agYudtvGpEeDz685I2AjA/WP
         OSDko3yeEJfGhAaaR261SCI4eXtLoWAJPTox1CJ8kIRk835oMINTNU0ZhXA70TqV188b
         UBoaDr9FZPaPyVhPWX91GAaao6vmiByeBq+Ob98BPAAkqLm1knwrGXG241gpD6njw49i
         1acpXpWGVx6qmNHx3WMQGzo8Bz8MF8WrHcQJZ1A+9J8f5fVsa91TAoXOnmH72l1yFrMr
         ebOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=;
        fh=0GfxyJJP8RADmUN47A1M+OKdNZtaeSwII9qrzvAqLac=;
        b=GQ9NiJImTaobo4qKj3m54YBc8MbMv/PqBGmJNk7MAZl84Fm3W3uKaO0HMglReJ6o+J
         DD84L2KAeszmLvbw0Z4R0DfqKbiWsC/jAf8pXTI6zLkcjsGWnjAPSJXABBacybDjVBWd
         BFEUh0kVjRSrwmYNQPjshwKCvyin8vNR4ODllC7avkBcnbVwXMI7DODFl/Yy118SRWUz
         lU6UviloRfA/t5xaUeL5LlK9zlURAOXmxaC3U66kB1HWx9OHimtSqxNxfUut9WKdej74
         4Nt8HPNUrrsDUNA+0+xJFEzyhO5KFubdXYDz/rBFzNrDb946lyx1IfRIDC0lBnCXXXng
         n6fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592092; x=1795196892; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=;
        b=JvQc/vtnezEIlGt8t8weKAvhsq/f86iE7dP3DATNLBbkH+WdlY7fLKA/m3JJCnOIUZ
         JBL8awU5obv8wBDuhpZVPdOxonS49ZPr8rXzEZyXL78UoENqa7jcmjLi4R0ILVxeKcM0
         MoKzrljgcHly5IGsBiPixYy5IqLDHrrSACSK504zfXXMTydaBkPBz+9KKt7RlRjVIITY
         3jckO9phzERxz0XPV3/24u/1qWge4bIeamsDjKXQkv5zkIO935+/bwNxwPndKhpyZvhi
         ZhNq38yGZ5N1vceTbwCk0rdrFv5uwX4lU0/Qm6u2ET7k4rAYZmB+IVKnxUzYnsyu8r0+
         fNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592092; x=1795196892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=;
        b=z1alQ4Pm9EUnzH4hnmAlzAJmCkcLPJlfwaDTzvlvhsZacBX/NAoDl3oEaJtLbzoLBc
         BZHPh+1X6RNb7+Q08DDYBhLGuMZQgmeCatrnO5BYnq7pn7q/4DGhPKWuDzxj88MJZVEt
         WNfKd/kEPyDSSxJlwKNKVEGdX5Wz9JTWJp7AcAMGcBz7xmRxjWliIXDV3VNq68HJZHzz
         BsrniWcQHBhLWMIM1XJ0Jh9HVbwvp+MV2sMiVCsHsWlug3E5Brq1fo4PB8+6n/zuFUWb
         qML2uaPORfGvKGTa/0zjVC1uo6UGf3X8wE39WVvG7y8w09/tABSXnMzKa6egivq1Q/eU
         QQuA==
X-Forwarded-Encrypted: i=1; AL+hErG4ioy+BWmUvaZVpKFNaWroK4L9qeZH9fIPskFyBup/bJ9z1VqxbfQt0q1jcDnHxqnacYE+Sb6JAatxl9RtaioC@lists.infradead.org
X-Gm-Message-State: APuU4Z8emNRStWxHCwxdZARkJbAww+wgtLZGBfpeCNjRzoAisRxhs9Yo
	5Dgq5iq4rX0Fhi3zL0468eqrLXQKaljWaUTuNQ7VGfbgOoT519QKgCsGgnajbA5oNKjgK9Po7rh
	SISWiMttLdVdrjLPUhIaZ4afGqpn7rdfsLi1j/GC+h/2eq7CBdDa3k//BRFBUZ5JlbQWDXSATc4
	04y2stCSbUzjWZdZvjBZqWq6R87JtkWIp5wuR+i8OfgPvrIw5/LLGj
X-Gm-Gg: AYBFou2MVd1ZGvkvBK7gAXUyzzfhaz3dhailMoM3fDzCH7zJewWHoAvlMarUGGXYqNQ
	KKsvyVg63U2qi4NvKZ116AvYwMWk4USdri45AOUN4yjcOUTemSdH/ShQIC0I4exmczoLqFPmkts
	VeQ5viZs9L7tUzhJgT67FzaqUIh3BKgsEAkgyDh9qTZdPXJ5Z2l1sTTQRaIQ==
X-Received: by 2002:a17:90b:48ce:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3b1b0a4e7f7mr3137265a91.56.1794592092355;
        Fri, 13 Nov 2026 09:48:12 -0800 (PST)
X-Received: by 2002:a17:90b:48ce:b0:3ab:188b:c5b1 with SMTP id
 98e67ed59e1d1-3b1b0a4e7f7mr3137245a91.56.1794592091922; Fri, 13 Nov 2026
 09:48:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260925041751.495818-1-coiaprant@gmail.com> <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
 <CALj3r0jMLFbz+oa_z6kySDg-3aLaFWtFoKv9VB_qHhQZDpemfw@mail.gmail.com>
In-Reply-To: <CALj3r0jMLFbz+oa_z6kySDg-3aLaFWtFoKv9VB_qHhQZDpemfw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:00 +0100
X-Gm-Features: AclHuK8g7tQW9S4ZM83ovlzdx6LVKg4onvs4sx_JqFXCpOEKhsosFCl6JEvlGa4
Message-ID: <CAPx+jO-+uwxMN3-LZn4nH4HSXu6GCnvdrUb9ff79W5EeCU4SZA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: mark PD_PIPE as active wakeup on RK3568
To: Coia Prant <coiaprant@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: pENaxnB6IthBzCOssFzzQEH3KmDtXvGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX2myhVf7gVB87
 Fa9j0FT6+IADnN90fyckmZhnwXitzQs/qczMIWhfbTqkT+HZgzEjy9xhrP64FSa40PnXYUskZ5t
 LxlEHpYamDanOj9hjOTo4a6fdQnYen1QzDFF95TtuuL5+8d3cxVEBxo/AodNAGW/REDq046T1Zz
 4h1B/56RWKdNOq877LkZKbT//bn1KRT92dvLH9sXP9MLsGYlD81IqciiKTliSO2s/zIiBxSMOqK
 cfAS7YJI0nJE4P8tgFa0WZBIq8h99aXl3GWmmG9oOcKp3ZuubI83eORtSQ1/N3Qh45OuphC6s7U
 YkYzFnPb/WhgvkL9kUrI2vqVW2+cfa68EJRibasZ24yIh5jHbHO18CKHj9wSfVDGjeVlhxXrAP+
 dmDzW6ZRMVGP8Eh33fcw9ohJHTwhmzRcTJY/xu13xB1cOwtnpQICrV9LKvWQVbA+23bSg3te8y+
 NHR0435Zp+i+Nba0KWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX04Mnog4SSLKS
 jdyDWdo6XdD4uJ7eL187jmeZ2oi2m03VMfn6jh4irkgFK/DVhffjftcQaYWHk63uD1Zl3hx15Ts
 kxpimVOrczPrznY3bDAOYBgR9QgOMBg=
X-Proofpoint-GUID: pENaxnB6IthBzCOssFzzQEH3KmDtXvGO
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af74d5e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=qR-pa9LE6TqeafLzNesA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_174817_983464_03577385 
X-CRM114-Status: GOOD (  27.05  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 5:04=E2=80=AFAM Coia Prant <coiaprant@gmail.com> wr=
ote:
>
> Coia Prant <coiaprant@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 07:27=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On September 25, 2026 12:17:51 PM GMT+08:00, Coia Prant <coiaprant@gmai=
l.com> wrote:
> > >The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
> > >controllers and the SATA controllers.  All of them can act as
> > >wakeup sources for the system:
> > >
> > >  - the XPCS for MAC WoL, through the SGMII link
> > >  - the PCIe controllers for PME#
> > >  - the SATA controllers for hotplug wake
> > >
> > >The domain is registered with active_wakeup =3D false, so genpd powers
> > >it down during system suspend even when a consumer is on the wakeup
> > >path.  That kills the XPCS and the SerDes, which breaks MAC WoL on
> > >RK3568 SGMII boards, and it also powers down the PCIe and SATA
> > >controllers while their drivers still expect the link to be alive.
> > >
> > >Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
> > >of its consumers.  Consumers that call device_set_wakeup_path() keep
> > >the domain powered; consumers that do not mark themselves as wakeup
> > >sources are unaffected and the domain is still powered down when
> > >nothing needs it.
> > >
> > >Several other Rockchip SoCs already mark their PCIe and USB power
> > >domains as active wakeup, for example RK3588's pcie and usb domains
> > >and RK3576's usb domain.  PD_PIPE hosts the same kind of
> > >wakeup-capable controllers on RK3568, so this follows the same
> > >pattern.
> > >
> > >Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> Hi Ulf,
>
> Gentle ping on this patch. It was sent on Sep 25 and Patchwork shows it
> as "Handled Elsewhere", but I can't find it merged in linux-pm,
> linux-rockchip, linux-next or mainline, and I haven't received any
> review feedback.
>
> Since then, the XPCS driver and DTS that depend on PD_PIPE staying
> powered across suspend have been merged and sent upstream:
>
> - XPCS driver in net-next: https://git.kernel.org/netdev/net-next/c/5e91e=
dfb0e45
>
> Could you let me know which tree this should go through, or whether it
> was already picked somewhere? If it needs to be routed differently, I'm
> happy to resend it.
>
> Thanks,
> Coia

Apologize for the huge delay. I was waiting for an ack from some of
the rockchip maintainers.

Anyway, this looks fine to me so, applied for next, thanks!

Kind regards
Uffe

