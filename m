Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3334606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gBowisFI;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5ARn3aK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V//AftCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=; b=gBowisFIL66W9t
	zBhnyPouIjrtsN97Zu+oFWr1WH7Axce/HRWcSOZn5WdaZm3xwBc6OwMOAzAyRWxd55kv9ztEoXWAW
	c2Fu6MKtCTOwF4Yw9bs9xorUyqfJirVceMh1YiauMkwUHxy6plGKvba3zUUySpphahpqqMvmcksgF
	1KeiX9AmDGYpL3KNXN0UFNhMvLHhWmB09kabA4RQzDtMtu0fAtYfsK59pXbOujx/YPR22cInqe6tQ
	Rs+Mhjr9/KbXeAFGp8J4jlnDEtJ80SYA/DGIl4CgVlrTHZ3APy3+dYDc26LZpOwFvfF84DlVWAvoz
	Nc2DPCdIyLEYtS6riSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv71-00000005ECY-1xkg;
	Tue, 10 Nov 2026 23:18:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv6y-00000005EBt-2k2T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 23:18:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAN8mdM570544
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=; b=U5ARn3aKRc/0s/xT
	AP3e7rZRyL9xmrEKJQDNOv5f2Dy1phwrmPipC2LpK25ZXhc+O7OiFH9cfPdcEmOg
	3oa/+DPEAHZEREiCESwy9fZmD7CMj5vQQvLXvS+xbLWfDmJ2EaCHy1c/3lbrtcno
	T+1RwunzOgV8WykCpRE8ZUVh9NXXxNIo/09UIOrLiO3B1s7qVkhG5uMjR3vYKH16
	Yl+5F4ccNw9XnJN8OJ76Ymbjcvjbge9dpZ/Mhj225hJiMOGn5B0vAtiYDQltKELU
	j/NhFqXvmRlfenWzP2BO2TmK74e0Tun9VfmOLhSOH8v/tLw284SnXYqSR4x+4Hz3
	NKb0Qw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvcpeg10s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:18:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so5839649eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 15:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794352723; x=1794957523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=V//AftCl6Mq2wLJC6rbV1yVI49m50nKu/klDwGPmz9F/guOgx+db6e9hsrLmi51zKk
         wGy0xdX5in5ZzcRgNf8SsDRJ1AOIipaVmQPuyPnLS4Z3jqaQb/+pMYR0RTwDhLSuYfvr
         ulEUwElrEJfgZkOif0FUos0RsfElrm4IwFHI6RMo0zeGMh0lJCVT05/ZbQjGroLWi5hs
         nBowgr4DuCtmPnR4Gjm3yIKbY4xqZpp8OD61ZUobQBuWcs0WeCObp+jGt1OD3Tukj7zo
         KeG/0Vz6om/yw0UhEbvB7lo9BadOp6epYTyLij/tt9chGEmY0VJjS+pIcU1uwxg2ObeO
         RWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352723; x=1794957523;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=nXYZqgMQC2ogHvgL9Jso6eJSYFATNoLZK9EjhGwqALg6tjNIXdVCYDVmEdAL7N38M9
         Uf+K03JY8x+s17hJYbNKprYTt4m2KW+Nv9eRPNkc726LKOBmzYlfEgtPW0eJJj/CbQkw
         4nsBYpwudCjwT+h860qTRzySSfNTCzsZbJwnDTeBY9TIp8JAJQ/5YzL6UgJeYnuqNH39
         8x+qFP5RRVVZ83XXQtiEfmErdBnwatUYWPf0OgLsnlKTcTfzJUoVV7iNFjEBx9n+k68w
         BrLY7Elnj78rD/pOwlUK3aHvmBwYocVtJL/lIyK6gGqg258bobxbBqeGsBl/UkefzlDj
         mOzw==
X-Forwarded-Encrypted: i=1; AL+hErGZ9WTec5Ix1hyh9C2wOckb14WHS0xv1969xDBA1kU8hcjTMvMq7wAzsHPCyFPUIbCKWP+1amQUlXF8uWcs+yVl@lists.infradead.org
X-Gm-Message-State: APuU4Z9H2tLNEiK0Jbo/K9us/4hgCO/CHBn6Gp08b6DXzZlAU6Zk2r0A
	lO1xthA80Jyee29PAiPGhkIbayCcoQGv4jrg55H+wl0rHa3QVfCik3fCvFO1iNRZ5mUpp3aU3et
	DJm3r3EfzA8veFtQWYul7noUTBOB6Sw0JEmF4SXUNrGmFOGk6s0YQVTDh+9PGqqZtHnwM3eKJEL
	N8tQ==
X-Gm-Gg: AYBFou06tGB2m+BLyYWo7A21QvrJ6V1+SRUqcOa207WAKm59llln/c3F3lOgG/cO4zn
	Pl222gVtbCOJVFPKqvLE/jYKcaJm0Kx8W2TMWmXit6TPy03+goMPateFpVo7xzzqC85W1qRhSBt
	A7LdFBt2PIrtVkn3Hm0FPUM5lqm6Ytyd+T7xcafWNq0zXq3xNyegdUiAW+H3Ktqhd4GhRcPoS+8
	/cvP7oC+AB0Zq7nk+F/evFGDNVz5Jz5uExoi9B8KnT8BXFN2ftBj41VDVTJNzFMgZFmfjEZYzH3
	TtUvyIXl5QaOd1v8nij64CMyLPAEQs6pw3apdjAeQHs80JbmvzUKZ0EoA1ewFAVg1aiJan2haYt
	8ZU5dY0hr5gwclnoeKq7+Ocz7Y6L6soNG6eSfloBSoLh9suLxNMhP046kS/UzdXETNr2Wcw/SQk
	hL+5V5Ky9OjJk2+go5pyIOIgc3oKs=
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283741eec.14.1794352722251;
        Tue, 10 Nov 2026 15:18:42 -0800 (PST)
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283708eec.14.1794352721742;
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm9454656eec.8.2026.11.10.15.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Date: Tue, 10 Nov 2026 15:18:11 -0800
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
Subject: Re: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to
 get/put protocols operations
Message-ID: <20261110151811.000001e1@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-29-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-29-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfXzIy9zKPGbT0x
 +9y96sAQDVAz5b0ac+vWG2EEGxBq1m78g9dbp+uQH6w/u1i3JIMUuddRoNXwMMaUoo2Mm00NISb
 TIeO77T6zAo10a1TzkS0aKKny/BdBnZa+ZubazXT1o5bEJvKQwir7fwvNDHQKD8e82ag1ooeIyX
 FfwkbV5zjMl11Xkc0PRH+5HnB1tLmPPX/kq3F0IuB/kA5B9jdWUp4y39utImDyZAD1tTSvmC6tB
 ok32zE2QodvASZu7x6FgT3mc6gzDq5Kuk4j3jZ40WlPZOpVSx5BXGJgSTgLKO/ZqifPcw+udlXC
 LL9hYWkvRy+jNW4zb+Apjz6Q7Bm6pewvqqFeM/hdXWr6lnDpE/j9h0sg8Uj9ZgKr65eYPspQPGr
 Z7/HFXanfQXvIB/E/RMYbpsEPLgYnLjjbZlA1D5DynGZfQZU9OzThXVfgDDDpvT/H+vGQBmRF+p
 thFGw1MV36+xo2RS5og==
X-Proofpoint-ORIG-GUID: ynVLQjtgBEX5ve7EfgLnXfL9erUmxOQb
X-Proofpoint-GUID: ynVLQjtgBEX5ve7EfgLnXfL9erUmxOQb
X-Authority-Analysis: v=2.4 cv=RfAFmFtv c=1 sm=1 tr=0 ts=6af3a653 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=SRBWjgdl_vfv6kPYSD0A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX8YjosJxdxsbA
 wIzfYFDqJM/tzNMie1lFsYEhR2VYuIjYTGDTUJf08djbEDgWmQ1H680BKvFgYXXCGbId6xbvEnf
 2gJQsLb94fwN+eg9IxVx40TdOQPTGgA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_151844_812374_5C449FA2 
X-CRM114-Status: GOOD (  13.51  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  9 Nov 2026 09:12:14 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a couple of simple common methods to be able to manually get and put
> protocol operations to address situation in which devres managed methods
> cannot be used.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
I was kind of assuming you actually use this.  Where does that happen as
it's not in the obvious place (patch 30).

Jonathan


