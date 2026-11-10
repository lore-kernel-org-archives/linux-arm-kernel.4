Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A44E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Io9bnAAX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbGuCeg+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cfIGH2hO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=; b=Io9bnAAXGxuLPr
	QoPSf0PnDkFTbeSMTJsDD3QY7mugVBhhaQZIjRCwgsGmCYiaG6oLz9QRX8CkMzZu3SACNxyFIKxuz
	VvrKduNE96KQrLMZ31evgsMnBcLkPeTovG5hiesgIaREdCkJx0ULeHYpy7pqGKT6hEkOTEItVLIMV
	xHvZg8vjPsw8FmpvOG/wdZeIRycHUNx+yK6sh0PGaHisgf+lPWMUBbryYwyxl5KIpHPM9gLA8Kvtv
	Bhnvc74Hw1Wffwck4bUo0DTbh1Kjlq6nUeZ50c6Kri5vgnvf30yq/HoA0ZBeb7U209S5LT6Ak/viK
	SNW7Ip4KJYAc0fWfVLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQb3q-000000027ab-0xNx;
	Tue, 10 Nov 2026 01:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQb3l-000000027Zp-0nim
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:54:08 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jLKW1514246
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=; b=YbGuCeg+OL8arg0D
	FQid+FuWjDgFl5JcYyY1kre2UEvasRPLKD22+ZYrNj51VN71fTosyJvCDHzRyPc3
	HD//TPeMyhbJmdlkcSMVsBMYECh7xaGi9cUBgs1sJHH6bx8IctqcQQ7KkfvC//2c
	KM2vUrPstmF97uhm8q1XP5zphDdR88bDTLjlDkzu/afuccdPWIe0YLyXAU/iT9xn
	gF12hCOt/h6KimzcP3mJonCKASNg0MS7Cfor5JWlap7AU1NF5eDbLE2/xOMt1Rht
	WxFxc2kS+6+RWiV7//ykBqhqoS6rMSzTEYkMxQAxTFRUMdkWSblhZ19brlHfUFqs
	w22a+w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydk18u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:54:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so417351c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794275643; x=1794880443; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=cfIGH2hOM36/97B4I9tgwqbKWnRF8sZ8QltN1vIOS9YDs/28OGKCLYSsHt9abI4Xwg
         M9vfRJiB+WY9Z1Q/2Nik7h9Du9spaV29THupcc1Fe/nLIj6Kn1lX+vaUOX4YOOo6Ao9W
         UeZCIVmyoO+nTVyVSflzOoM5Jsb+tmmsOL+9jPPM2ko4aQIQ0P4xQVlyMsfSBDKfp3Dy
         C+JcUp4reRH6heLWH6PbOu1CuzjhtAVV4zVSQc8FOMJ0xPuWG7f48PeWRMSe5yZyNRQk
         GjG6AUStll3Axs70MnA2DGMMpJ8UGq9Kc3NdmLjKBBXGqP5NRUeffmOi+NQn+L2wZy6r
         xAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794275643; x=1794880443;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNUYRJyOqyBXuBM9afubrzQAAxPsq0B7mcCz3ADXaiA=;
        b=r0WzAH4N5h6Zbl3w50YmSt1zyp1bNQYTZW/ZjzEaM2OC4PUUVgKF1znPf1A4m61I5T
         +Mp3FgW21wb7ko+S9IgiXg8+NwCoibcVT0xubC0AZB1gMf+uDr1YlldFm0hZho1UUUDt
         5T12PsoeqFja31eka8BH7He28aBvYwT29/zKjHAQycAOYJAc2mfiUQ7SDJ4eiW46JH0+
         w/pETeeRQre1SNN0P2iaC9IQzyqkDtbwL7Xqrq/Ol5OVuvp9RQ+eYM1ksaagkm10mqFX
         rXObXlvvNXFJqj0/Lcy3w6Z4iCXoh39P6411DIo5S5+j1+L6cu4+eeDbEpFVimhPKBzF
         dSIQ==
X-Forwarded-Encrypted: i=1; AL+hErGmA0sXVBDakGckbcF3FHkWTzGicISyzA2G9iOJ0S0m/P0wRMGnqNYmcbmfSd/RBkLwaS1veivaMpeHGDSqn5lw@lists.infradead.org
X-Gm-Message-State: APuU4Z8df0JgoQqtHAv5rr5n1oubp1elxg8QYVo+vH1nxGsTTy2yvdMB
	6tIBJzdpDU3SFdK0xu9YFc1EoCIK52OaVUDJ0Dyjy8DAcS2bGUeKtX0tFwvadANUA2ZEvnuTzR1
	m9ixVaCBMytt7GWggpPkVTqx48KCG2FtSQbHY7BUd0kCsDxqRI2sFnfB4fUe/0HNc/pUboe2kfA
	R7Cg==
X-Gm-Gg: AYBFou2xIMFCW0nZz8Tyv6Wl1buII1/oGpz27vCTgNhnJb7zE2Y0Q5hryyqEhvKjT/B
	XJ5n8zVNIiwW/3F3zzLU6pW+Wp1yoh4TVms29x8psU7aCSv+ykHxSmwPeJdJv0i25OyZ1/uTS2D
	xZ/utCqcGK9xS4/8ysS5xPL8z/QIJUf3tglJv/Oqm0dIhi1Uv+7tR2HgPtGnI5xkQryY5wsmiJZ
	vL1QlYeD+6dwSV+rJo06Y16vurRpfsBy/A2+CDabUjbFk2by/tvXIIV1YdAhBAP/n8kf5hoaKRM
	7eVdYcFjZEZul7r4x3vBKPtJzJfRPjTHYzQs/RKj81i68CeSG2bxvbYyGjuaRVy4z0zBj8sY3Tp
	z9U9ghNpCS4tuRB8V1J/ETbD8iVVwUYYVW1HVec6V8+V5XqSrO35yYXYCowcC85YQBFbKarKnrb
	9rkt2518rbu4qpIAIAGi0ZI+A1yA==
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282473c88.12.1794275642853;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
X-Received: by 2002:a05:7022:2521:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3b5fccc3emr2282413c88.12.1794275642187;
        Mon, 09 Nov 2026 17:54:02 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm3080274c88.4.2026.11.09.17.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:54:01 -0800 (PST)
Date: Mon, 9 Nov 2026 17:53:53 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 11/35] firmware: arm_scmi: Add Telemetry groups
 initialization
Message-ID: <20261109175353.000008c0@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-12-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-12-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX7NM2Ps2BWhiC
 Lek7TpOOpA5f1+RZz0Bs+y9f2HIpwGCdWNe/wZG61vZ3CBMGig22iEuXnbg3YWCZk6mpy5QVePr
 V+NGpZORqQ6CSn0RAZawYuDGKFugzCY=
X-Proofpoint-GUID: YB31gWhtu-lJIXA0MpCo6evurrupAwUS
X-Proofpoint-ORIG-GUID: YB31gWhtu-lJIXA0MpCo6evurrupAwUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNyBTYWx0ZWRfX6Qzgr0KnrJVS
 zeluK8+dkqWJq3JgCFGuC8p6ZvyxYRlmmuyC/7GL10ZsJ6HCs+FjQBc4F4y0cLX3aR+29hXh67C
 xX5Cdrfc6Mvn5h8Zz2jMdlkCrnwYKPtG68pat2OFq0Mdpy4pdU89LJHxkK6PDrxrKh+ltCYbijI
 G4QYt62UA2coR/52izCBOxsxewu/Lpwg7b988vLnsGS0MhtHXZxOPolFNpFKxYTbQ2txpUWlaW2
 vOBQe81ZBLjxscXiYyJv5DqNX14yBn8eUHDmv4Zrr5X0/yT6DuAbRU6T5GzFwlh5hFvXit9TCqu
 QhUdBC1pcpYWBNbsFxbjt5tTcCF6Eyfec2txFKTToDk3pLC/I7vqYlS3c0DyEcRLKW92yigo7CZ
 RDpKQbKPeWFpBbP5lb5t9EaN2mEkdNIYkmfzlkGOTO7NIMaGgBurifKCz8EnlrCIu/jPm58iPdX
 LCH5kCmUHTQSoEqCTQA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2793b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=0-nDijDy15vjLcikf0YA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_175407_878856_77975A31 
X-CRM114-Status: GOOD (  14.68  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  9 Nov 2026 09:11:57 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allocate and initialize Telemetry Groups from base DataEvent data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


> +static int
> +scmi_telemetry_de_groups_init(struct telemetry_info *ti)

one line maybe?  I guess follow local style.

> +{
> +	struct scmi_telemetry_res_info *rinfo;


> @@ -701,6 +833,9 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	kfree(rinfo->des);
>  	kfree(rinfo->dei_store);
>  
> +	kfree(rinfo->grps);
> +	kfree(rinfo->grps_store);

Same as earlier about reverse order being most consistent way to do
release of stuff.

> +
>  	kfree(rinfo);
>  
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
> @@ -722,10 +857,25 @@ static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
>  	xa_destroy(&ti->xa_des);
>  }

> +
>  static void scmi_telemetry_instance_cleanup(void *arg)
>  {
>  	struct telemetry_info *ti = arg;
>  
> +	scmi_telemetry_groups_free(ti->rinfo);
>  	scmi_telemetry_tdes_cleanup(ti);
>  	scmi_telemetry_resources_free(ti);
>  }



