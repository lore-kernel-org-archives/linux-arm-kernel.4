Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772DE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zh2dYxlA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuV5uhcl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HxB4AEtG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=; b=Zh2dYxlAj/weLb3sniZTQ2ak/0
	5PDaufaXk9QDbKFL9RSCHQ38bOoCbKxHimDUJ5Te+dIyp4a6N/ZLge76vlOgee5Ujp92PR2Dh9WfY
	IQYIKh+9r3I546zHZ4xbYSJqGMHzi3NaielGkDiVziAk3iG+cpxw7KCzUaNGr8V/piIBBI3smEc9k
	iS702kixsVRvejbOZgxXESXPHJxb5ywu9cO6EcO7APbeIpi/1+SF5Us7DWxAv+Vzu8ztrU1u8OZUe
	la8eC860867yUepgdKXi/uXr2fyTmuAGKa/vCLeZLHNxQ670XB7mGm3DifVoc9v3rWKZbhYXzfz6E
	LPiY4yAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX43N-0000000091h-44tN;
	Fri, 27 Nov 2026 22:04:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX43K-0000000091C-367h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 22:04:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAtoQ3038719
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 22:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=; b=Vu
	V5uhclGLJCw0uuDKiYF9CAaZtWBrhjmkkK5vqeYo4SiQvna1e7VqqrIsW3j2OiS9
	0/mzPioQGVmi+zv538EbWc0GY92sAslAei8nYZ0pwFIcL1BUQW+tHa2o8fQ9v48y
	9hTlRQlYhqIq3gvlaomL0BPc+7CfUlVXyQGTSiEzifDRX4aOAomRg0aMGI934hg2
	jjfgoKBjYyXAjYRqilnyAUCHA3mZnSy0rLXW/Kr/cGozYEcZoNGXGywinJ/wwBub
	yMcVjuGvijFy/92EnyjECH5/xlx9k36H2H1a0sysBHaX1wM1HfHaxgbi2KxQkdIH
	c9uQup0+e3QZr/MrFJrg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e4ngmh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 22:04:18 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46f178d813bso4761091fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817058; cv=none;
        d=google.com; s=arc-20260327;
        b=FixoGK6D8vASkK1paZ29tgUnnKsuod+CMj/nqn0IAe+bBBR6Qu4AgDMFjLCMOruDoZ
         4+WoyycQp0VWpCj0M14lU9/0yQrKHm3pkRXwURolaNBmEdHI7HYCZJ60wL4A7tSCkAh9
         pisBNCsdEG8sUYRrZAe0vAVRXX5lP8GJxy4tyObNcInc1VVnWrtI2AOsk27XnK16XJyx
         sNRpBhV1S3N41pwGQVk7FPENwpcqNey6vB9co687zeCiUbpborovKkjbVEJ2PjOQpwxU
         /QkTwEZY6TyruAg8y4pPzfSnmHDG9bz0m/cS3riiwSfF2gJqoiN9dBSMeGLQ4u5HbCiI
         c81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        fh=speaR54+kzAIxrzda3S8pyKUeueDnZTcBa8J1v2GK8Q=;
        b=XE2Gu/pGEn1NCh/ONc0R+/2kWYWRzHZv7MjyZ6o6UmjjBkFF2c/Jmxv0cdn8z3csk6
         hiis88n+wxuxu/mSqdI7RC2/9Eq1kTeld8rASWmZNhFZ5V3J4eNyZqa3tFgq/AKfxfjA
         D30poYeKsfT2XfKV7bxGzCtBdsZgGsdT5BxVOsFENJFqpHOvUkLSoC/CI5sCgdS1TQY1
         6/lAQiJU+P/p9aozLYkuJQMhzTar5ZAhyJzP6z6S1WCsBvyxUoWWy3a3Kj+3wTIGjmfx
         CH7/MS6NHrusSwypLxFrVQH/Sbi08HQlPf4VdX/3/F3DBX05FIBO8aU6IP08XjFb8WFH
         k83g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795817058; x=1796421858; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        b=HxB4AEtG1kBIhWS+67Ud54+2MXdDh2gpllD98E7chE1ohR8Ufy4dLqN5ktenhOXtH3
         Bq4kwrmObMiSmTg/Zviyb2RK/RoUxS2QJyhnDONBEmJ1XiCQvEXJW1paeadDBvTCFxEl
         niuykMZ7EK7Aof4d8Iycv3zxM8uwHh5uHQblBnHGwymFPqC9YxScL1qxvOQXjUD6JiBu
         izuNnat2+3h+hoEFrkNHKW+BW8msMPJ+x89j+RDsUZEBXySgcHjLn5Etc8/KplkuA58D
         +b7WgPt4XnrerCVU1jc/PFerJTpVMb9OTHF60913hAqM67x91d3zZcyX4Pcxx0I0G1xQ
         vXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817058; x=1796421858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGegOYPUkmuOzaJl4ip/1ixl2J9HWePeYSjpj3fg+rA=;
        b=Rc8xO8BYng+f9wo6k4RnsvKBiHVFIrbpL9Iwxn5eFEDDkQSzqgBhFse3hnIzjAYQGf
         LGXCf2Lt44gcr17scMwP8shs2zbFaVh/102ClWkEKcXMYKaWJsRY+taqElRJJSoYcnA4
         gG6R/OS4QRJ8rTT8/GVTBVjq/56VvB3z4ucFE7BDvzB0xUWzOv4CcioyUXHBbrUH8cXE
         DS6J94eOO1lpt9PwNnj9fMk9Al0TUb3ByvJ6SIyDIJL46gFOPVb+309oD5FcigLQmnX4
         oi8dGa+YQ3Nn4S8lvrxzAKBCWptUx+Fz+No0/96n8AnX/ib5UswJkdP2w9dZU2jGNO9e
         WiMQ==
X-Forwarded-Encrypted: i=1; AL+hErHjSQWxjA5iRkh2Kp9t4AkxtLOYlFX2iY0OnbwYjfJ0sWFEIOL5DytUk7FTtZYbQeU7pCPVm1y+DJSrn++diRsW@lists.infradead.org
X-Gm-Message-State: APuU4Z+Azo3WOypB4+fUbeJamt8aiNIpPscfImoGepDAT+JnGr4OPCFh
	yr8VSQwDIzcJhaKkv5UwFbY13R0+D+7f270jx7fGdvxbijpOAOAO1+XRVvXzx/cwbvChP7ts46H
	vWC63uEW4Y/DTCEdqkJcNnQBgYFiKtWgeX1IjY/Nr43SvnnkZvrHqrTs22eQM1kcdA0W8tcPHXt
	T+j9HgxqZJSApNtcW+NmeAKJBc2lLuGCPx+gE9kZmyh5g2d1YQHaf8
X-Gm-Gg: AZFdTZcFTmsYZ/G+BhBVR0KOn7YQpHK8pym7ZZsW4ShpbxaIVJjmE62iCco6DFoCk5h
	AN+fRmQfpqFr5KOX1Kipe2Pc8kmD7onX44qdIIuffLeheYqRUH9FqlExg6VntbqyIiSUWa082uI
	9jbEmmRTH1XwN7Mt3SzHcGKixL86Wvb+hyPD2ne34YiXgeXU4T3a3kbdpec4NOXtOwsa0aefyWw
	YsVvoPKuE30WbUeeTxLZA==
X-Received: by 2002:a05:6870:92c9:b0:491:6c73:817e with SMTP id 586e51a60fabf-4bc7d270fb2mr24823486fac.5.1795817057625;
        Fri, 27 Nov 2026 14:04:17 -0800 (PST)
X-Received: by 2002:a05:6870:92c9:b0:491:6c73:817e with SMTP id
 586e51a60fabf-4bc7d270fb2mr24823451fac.5.1795817057156; Fri, 27 Nov 2026
 14:04:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261127-qce-fix-self-tests-v13-1-80b601792901@oss.qualcomm.com> <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
In-Reply-To: <648c686f-c20a-418d-9314-4b269321406a@gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:04:05 -0800
X-Gm-Features: Aa3M54roYu8MrDi1iygKtDP3qZ6YDP-WhV4C28xi4aVFCCESr3FORy1xpwMQ3ZM
Message-ID: <CACSVV00Juw154J08msOA63a-_4TYvHzYqsjPnD_nE6jg-_=GZw@mail.gmail.com>
Subject: Re: [PATCH v13] crypto: qce - split the crypto driver into core and
 crypto parts
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4NyBTYWx0ZWRfX5papl7IlHrVU
 84N8ix5rG9EYwCie+hveZa++wdcBQz+80BMcQ2nm6/nwPnYBjxX68RRR/L64ng6Ak6JhA7TrUO9
 2hl4J7Q87aMbih/VP8fh30t3/DCyCMo=
X-Proofpoint-GUID: BTpa1A6kKWx4XOmpxhgqfBd6fov6UCEj
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6b09fe62 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8 a=wJmJrFKEA18kwO9BSagA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: BTpa1A6kKWx4XOmpxhgqfBd6fov6UCEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4NyBTYWx0ZWRfX7qRO2GYwmD7l
 s7KyaBkGWZtzUGXbBK46FRLEIgxwa9wFZySZYvB8xh3PNaUmKFvQZEHax8tvmRHxtRObrEVB1Z7
 utFvLUtlBYAh7+ytO7orK5Ucok+ydNQ1o7sxojSWJudvflddvoWv2dRL6SsBuMYFPwq8GBXfX/Z
 NObXjJN6xYtTDU7eEj7/371Kj6GPllwkfWp8z5Mn6YBSIMswupFowOxp1t3nEVzUlpFv8YgDBD7
 zaiWDXewxDTJDoCaRb5nq7XGpsnPprlywmOvr+ENzDdJq6HIH01r9Js6uH8dIXSUFqySSyeikeo
 TdYe2l9HAc8JXThUfw95b99fNyVe9HntCJuqe/hK1CCoya1XHhSVmanqsISEcxoWA8JCn/P+pVZ
 CGBFRq++2kWk+3H7A/QnVEtpazjAOaorbWByZ3fk22Av0utmt4MbNs7QrESyR265/joIeG9ibcg
 9IyemT9HUHGrO1CvyzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_140422_829199_B31E30A4 
X-CRM114-Status: GOOD (  16.84  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 1:35=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> On 11/27/26 12:38 PM, Bartosz Golaszewski wrote:
> > Most users don't want to enable the crypto features of the Qualcomm
> > Crypto Engine driver. However, they still want it to scale down the
> > interconnect votes to 0 when unused. Additionally, more features for
> > this IP will be supported in the future (for instance: for secure media
> > playback use-cases) but this functionality will most likely require a
> > new in-kernel API.
>
> Nit: Can we use "restricted" instead of "secure"?  From the user's
> perspective, the media isn't any more secure than any other.  It's just
> inaccessible as cleartext.

Very much my own $0.02 here, but for better or worse "secure playback"
is what the feature is more widely known as.  I haven't heard anyone
ever refer to the feature as "restricted playback".  Not trying to
argue about the original name, just pointing out that I think
referring to it as "restricted media playback" is more confusing, not
less.

BR,
-R

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)

