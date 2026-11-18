Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A95606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=321Ua0/Q;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzXoqy9E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OwGudlZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=; b=321Ua0/Q5DoG4h
	5l1HT+L58NNw31lHPWe3e2A9/kxFWwxGDjMejxrMpeSj5g5HjSKc+kqheF/HU6JTlmVqmzWmy8eLl
	uYaVItKyNNBVLf2E6ucMerp/u8s58+lSpnLSR8lrcJq73Gsz7j8jEOncAXuvOgVk6vOw0pHQn2oRe
	1cPaSCdwmtlgdJBdlYLeulQ5LvMg2Hz1PTRJxTu8CMmxc2cDj5n+Z976cypZZiv/1o0FYcPXxakqg
	CAWAkYZypI7yzqXzUCbnPkIYsiIKW5uMqNYDekVwgeHp6+b8WhE7kzW+Y5vUTWZd94KG5jueX9Unq
	oR75tPZx8y/b6GrpUyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTotq-0000000AT2s-34GG;
	Wed, 18 Nov 2026 23:17:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToto-0000000AT2T-2KdM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:17:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILDYx1274787
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 23:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=; b=WzXoqy9EZ8KUqGzJ
	dXcwQReYR+9nFSrq0rPM9W0S5fsrigFhMcZUm1L203qq4hjYQlupifvfpSbRBWH3
	vx+FjGkIXoIPtxMSEFxD++aCJuLCSgLUrBX1ObLXVHM9EJJdytruqp+W3Ag5vTIK
	qj7ztlV7CjWCKf1lmYEsj5u2oyN7yxYTlk/PQQBGJ4PZGoWt+MALbOv7lewgWnB6
	brOwltFJANKvco4ZYgD2EwVnNsvPBWHucCg0zcUbpZcnoPWLs+S7ADwAtF4k8ABD
	DScPdnZw0l5oTjPjU06QTe3g6geaPCqsdUsQRnwp0PvHfdg6mFtEirwPiAG6I1ki
	FEdSrA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpca7pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 23:17:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso4173432eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 15:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795043827; x=1795648627; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
        b=OwGudlZS6QcSHBfVWTPdP+4ksUr7sqwRN4gz0ZocHcgdovRllzN0Q2jv4UBiJkZmaV
         RmCwqz7qXNXqlsNNfTKTjgt7SEKrzF+an0mZK0fBIox43DEOX7AEoZjbzV2N8yo1mv62
         AgvuExPCwH/rdqLK6UB9/CHLCDx8hm7cUfnUgOukqY1Os3s/vFBYI2s7l+XuSrp250Uv
         H0lJIzmQUnjJU9AA0/zZHzp0JYyhWonUsxjnpjP+jKCY25vgbmIW3FqEC821LgR1dzry
         VqlX7XUiq2O7T+RZ0z1H+1fCCcrHlNslmSebekD6awrQIFdJohK02xedkHBmhj1mf/ni
         KJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043827; x=1795648627;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVpZsBQ2E3YbTOVgeYCjz8Lxd6C9Ro2zeP2g1RQdtq4=;
        b=tmIJAgU9NBPXqwg0g2ooPQGhcADxhy+KBs440x52c3q3fWnySlcixTLqY7D1tFPgmL
         PgmACM6abLeG7VyEWJvNa+PzVNdF6qCy2EkOX9iU9/QE8/xBEN5cBilN76yRzqOlWICp
         fFfPDaD9fT42aZlUvHnpjUG13K7LGlVl+ouI60P/NEpv+1AfJQMcxFzZD+/JgxK63UVj
         0lkPvk+Bs4NbeXVioaDn3mbScK/22PABA0BmjPmI7GDe3lQ5vvygo/Y/yo4stKpeGBFs
         PhpRC+HY5627PG9yRSfs/fnXvVG8ZQwQzqsw04PBEFpAVJoYe2sLdpceuIDGe15Vn3kf
         Kp9Q==
X-Forwarded-Encrypted: i=1; AL+hErEblbTOASXKr2ceJUXXA04PFmRi5tV238MwSDRubbKyP64gbVLwMU+P1hPQ/QyxJmg0egVJItxGkYuyF8wMjFSv@lists.infradead.org
X-Gm-Message-State: APuU4Z9gO7nbBnLv5ADJ85wVFJYznCaG3sLa3Fp+6qjKw7W4yssqrQkH
	K1bbKpJSZIVbXrRUDOE1/3usFSq+zyiAWkc9i5cyPFi4i2HSuJkiyG02lzuXUQWg3kR+/h8ySvX
	UB02tFFt+JVla9zELtcqk0C6AM6tXOdJ2rKr7bY0TaUGCkTzaVrdQDCdToFSuDGHgFhv3Asmyln
	eUQw==
X-Gm-Gg: AZFdTZct1pjoCNuUuEHEe20SHBJTRSlvmb2XCm+qyS+Ug/TrP9L8ZkW7/rkyRFQrc0p
	CM7Oe/HTCttHB8mQZ4tuwe4RWrgoKiwbDMZoHLSKJ4KSiDJUHB8O1mrNht4nzfL/SvzhVdb9woo
	VHpPiYU2wONemWv3E+Eslz+mTgb8f3H8dBS5YfUcB5fhwstZMSzatwXH2EPhl833VyIqE62HR8y
	0h39yBh613FC6F0MPmTOyuFX/KE6gtl86J+E964UFYmc4DsCejq188p7B9TL8KIQSNIOwiMK4Em
	CTDTCT1HATcziKcK4uva6IKiTDqxDqucEO9GQAwbBYfctkyvXfmW0AAj7eTMZoOKGEw6MiHr+uW
	cltSmfPSBwvvStm6B8EAmOYtP6Od1fSclXiWY5AGKXg42zqW/arCxpk5V2uwErSap0mnkT3Mrj3
	2nwsPhvOK55nZRcT2OBysXcz0YK7g=
X-Received: by 2002:a05:693c:42c9:b0:36f:a72d:29f with SMTP id 5a478bee46e88-3828111ab25mr3971443eec.34.1795043826812;
        Wed, 18 Nov 2026 15:17:06 -0800 (PST)
X-Received: by 2002:a05:693c:42c9:b0:36f:a72d:29f with SMTP id 5a478bee46e88-3828111ab25mr3971402eec.34.1795043826254;
        Wed, 18 Nov 2026 15:17:06 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7eaf3b3sm12541673eec.27.2026.11.18.15.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:17:05 -0800 (PST)
Date: Wed, 18 Nov 2026 15:17:01 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
        linux-doc@vger.kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261118151701.00007190@oss.qualcomm.com>
In-Reply-To: <av3w1CbwYxFRPStZ@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261117170709.00002088@oss.qualcomm.com>
	<20261118-poetic-robust-raptor-bcff2b@sudeepholla>
	<20261118093203.000069f1@oss.qualcomm.com>
	<av3w1CbwYxFRPStZ@pluto>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe31f3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=iv0zGsx7Xu7kTqO63LoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX12BRaLDs/6gh
 kTz+kUMZdHMmecjR01jwdQRYoAOYJ0zf7XrU5WFZf1fIZx3TT2eG81VZP/Ox8KhEdTIO813Oahr
 6Af59p7TWNvpQFcxjW3y5A/NZiZR/fqxrTCdyzQnzOq3Zb1bRF7DnuYNztJihDcT5yXjNxsZvph
 MmeCQG1MLtNJ2yU3kC0bDEP1Mm7NlhSVpoLmU89/R8EKNunhq61yUb7iu0gNW3nhTSLvvVYV/J3
 E/lAeLbtXKpmUlSH8LNy6q5iKSLYx/+uqAHgjB5Rd+5H+GDXmz6P4hH8gFRHRG2v2y4pefp/xwK
 Y8aiQ6r5k6IoPH+l3xLTrslFMvFXKWiNCA+msj22lO2G5iXEuTsA2r16nhTcdWRS5FIuXy/eK0X
 thV/YB2Xu/VRkJIMFvIkCYSRHqZE+hA+his2IVLOJ4njw7OgFyYsCOvU+JdofI8c8Y2XaXRDBsg
 asHC1tuSqm67/S+WRYA==
X-Proofpoint-ORIG-GUID: sjjz-96tkhB_5EyBW3JygEG5LJhq__uR
X-Proofpoint-GUID: sjjz-96tkhB_5EyBW3JygEG5LJhq__uR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA4NSBTYWx0ZWRfX1JJ33ArSGxLe
 VAdXHcmjBf7yCl7eiYJLRIRk9CKpc/S0CCMhVeVuDUdH3Kl/aqnVNhuSNNgxzH1QO6hIvBy69Mq
 4nWcT2nFeYJ2zt9ojRYIwcBRH4/KVDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_151708_630879_2EF9950F 
X-CRM114-Status: GOOD (  36.81  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 18:39:16 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Wed, Nov 18, 2026 at 09:32:03AM -0800, Jonathan Cameron wrote:
> > On Wed, 18 Nov 2026 09:33:44 +0000
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >  =20
> > > On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote: =20
> > > > On Mon,  9 Nov 2026 09:11:46 +0000
> > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > >    =20
> > > > > Hi all,
> > > > >=20
> > > > > [TLDR Summary]
> > > > >  [V15 highlights]
> > > > >  - general cleanup and hardening driven by reviews
> > > > >  - improved TDCF access routines to minimize lost samples under l=
oad
> > > > >  - completed ABI docs
> > > > >=20
> > > > >  [V16 TODO]
> > > > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > > > >=20
> > > > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI pr=
otocol
> > > > > dedicated to System Telemetry.   =20
> > > >=20
> > > > This is one from the family of issues you find when reviewing ones =
own
> > > > (well LLM generated) emulation, realizing it doesn't match the spec,
> > > > and yet works.
> > > >=20
> > > > This works fine without the required SCMI protocol property in ACPI.
> > > > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > > > Platform Design Document. 111115A 1.0
> > > >=20
> > > > Now, in here is an informative statement...
> > > >=20
> > > > Protocols not listed using a property may not be enumerate by the o=
perating system.
> > > >=20
> > > > But they are...=20
> > > >   =20
> > >=20
> > > Correct, I intentionally left that out. I do have a patch that restri=
cts it
> > > strictly to the listed property. However, I held off on pushing it be=
cause of
> > > an issue we saw on an internal test platform.
> > >=20
> > > On that platform, the firmware advertised the protocol to the OSPM vi=
a the
> > > base protocol, even though it wasn't functional at all. Once they rea=
lized
> > > this, they simply dropped the entry from the ACPI SCMI device as a wo=
rkaround
> > > instead of properly fixing the base protocol discovery. While underst=
andable,
> > > relying on that workaround delays proper firmware fixes.
> > >=20
> > > That is why I went with the non-mandatory "may not be" wording. I am =
happy to
> > > merge that restriction patch if a real production platform actually n=
eeds it,
> > > but until then, leaving it open helps catch and fix broken firmware
> > > implementations =F0=9F=98=84. =20
> >=20
> > You can't merge it safely as at a later date because chances are high
> > someone is relying on the current behavior and not presenting that
> > (currently pointless) package in ACPI for some protocol or other.
> >=20
> > I'm fine with a permanent decision not to check this but I don't see it
> > as a thing that can ever change (except maybe now whilst there are not
> > that many platforms out there using it!)
> >  =20
>=20
> Even though the change would be at the transport layer, given that it is
> NOT impacting the Base protocol, cant we anyway quirk it later on based o=
n FW
> vendor/version as an extrema ratio so as to support anyway older FW
> leveraging the current behaviour ? (not ideal I agree...and I have to
> double check what changes could be needed in the quirk framework..)

Quirking after a change is a pain because you only find out that it was
a problem when the regressions shouts start occurring.

I'd quirk the other way and paper over anyone who requires that record
to hid some firmware bug. Their stuff doesn't work today, so no regression!=
 :)
>=20
> Thanks,
> Cristian


