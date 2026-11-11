Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D5C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S+yC98wG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhHsZnpy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjfsrlHT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=; b=S+yC98wG/vnMxH
	FlAj866uT3ycPY9SfEnn+glOzZaaEEA35EbA90nJLv2JuFoC2UO/ZPFjsK6GVRy6/ZdHcYfeQk0+g
	jyspavzz2Z3NekBEj7wiGrRN8/AeBHLTx+n8dOAu5smC9ZmPpSccmajY8p3eXTLTy/+uERjUZ79eW
	9AJbO4IbdEozvtznqXG4XZbouVP/7R5GXoHCzgIQsO8k6nNVrr+I9HFbzfyLP9vpKVRJ8CMox0LUd
	RXsch9mAiiaW8yKAcFbRI/fpVlNoVMRU2G3qWTeXHDC8PrE7aifebWZWCMAz71KlkBdxrHSaUPbEh
	A5w3ay1FIiChn49aB6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDEJ-00000007RDs-0Uwt;
	Wed, 11 Nov 2026 18:39:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDEG-00000007RDG-3zkk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:39:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIZ5ip1490692
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=; b=BhHsZnpyTizIvQNY
	Bpf9ADagu3a4kkxcvWRuGy/1uacyZjlq1SPZDqr1f981IisEhxXc+Km2rw6SWJa/
	B/Lyxbak5Jcqu6v3omddg6Ibx9i2+7+EcrCRWLoenZiDOWHGHYrPlBGlsZ1W3Fis
	lXGpOJ1MDRSXy8v/Sdt7mUPhCD/zW/bMJNX0fqEinAdk0kLFx/qhHIRmlYR0s9/z
	9qdsZOVu1QHii5KPlPptE+ZCJvOMsEPH1X+XrfEEEhA1RYR1S0Dd1CFDi9ORqT9Q
	36jtCPbZhj7jGoxgMcn5fll2goWlMsZIDKfeK7XmIhaEiKk1DIz9x4LI+Oe+7Hp7
	iQPUXg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1r1py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:39:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so4081026c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422367; x=1795027167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
        b=OjfsrlHTJC0IE8fUj9tDZIeEZ6Pmn3ykIHuvg7HkMTCA/yBT43WNbwzkhT1MfLeaIn
         LMfGQF69RUBg//eAQFyt5sXajVUG0Z77ESDWN+ao7yVJjQhMvvmuj1glcYygal8D5Dbm
         tLsqY8fb/ZE2gI4X3aIr4G/hQr8oWnOoP2tLbgtYVPxcGZXXb8O6R1tYyB7svEIXAksV
         XLfoIyPwKEYPHODwbBZo1N3VbJSDsWI5+9uHc9hHy+Ma3MHR6OsbYFRg+q0NthDUs3iU
         wZ+C+DszbSiER4jM64GrXnrjbXv+C1ANxCsBvmjz20Htc4QPpzG52IBQujJAZP/LzOXD
         KOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422367; x=1795027167;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRLMEN7xwMYs3ZpUgHAtG1UwTe/c78BkMK0uijF6N4M=;
        b=SqvQ9G523vdI9LZM8/tUdsWLEtdC8mS3HdYtFcp6j87fTCPbPQ2xP7usUhA3K3pupB
         6UNBdr0FqfUNlPI9LGsCxyQl1+GJXbGZ+TXBZshX1PpCfYsltMyHIluMh/BLPzITNa5E
         mfgm5cqFbSKaIwOop01D4Nst2tEfkik4XKU78p5zZWa+mYtZ4abMcd+uUJolBb6nIOkH
         0+je1+RwTFWhoDccDbRCi0jem0WmyB2K2IYF281DqY13gavSJ3650t5E7KeGihwa6y2e
         DmiECQs/hQaQIAPcqaGakFkMroe66MYJCJO1MhQyUIqdxF5sQgiVSPmaNNan5cdFWH7e
         hnCQ==
X-Forwarded-Encrypted: i=1; AL+hErFCmDJlcdy2gCxShDjChHqgtBgWom+UkLv+wUWyoKG1ZjJ3csmFPrh41DZO12a63sgSozhvHoLuoXTBrbe6YQ5C@lists.infradead.org
X-Gm-Message-State: APuU4Z/bmcN9PZ8v8lHm+lvWw0aR2teZvLSu/ltobszgFbS5RiVft3R4
	4xMJzr/Y83rNzNGFaAa+AaWaEmaB73uB5+oWafJjIfzJF0m24MTelJ0Ei6W1I3MkXiqbbAV//xV
	1QFFTiOsmB+SP5yNT4fv1WvzzvgbPIS2cu4Rf0qSlik6Gg3w6wVEx+iGPQODFUwdJX3efNMcKm0
	tPgQ==
X-Gm-Gg: AYBFou2E6EVhESkwOelhoSu4eGSUnTE7wIax5hPu3QzbOPOZnG8MBWcuPp0gO7l5r8N
	YZoEM8CA2Dfe9IJXn3kZp8rEwEA4N9HVEAedQiB+SDYR2bEIfAG3fqsnyDOU5A3OxWgVYnqWXrR
	bzTG/UvVsxmDA3byfN9/SsHt4Nhpwe8gz4F1j8GyLzoz4dgVQ0dtiR+B1Az6TS33bGyicjYNXlt
	myDBqp6qV5XNCClpAEssXDDvluHWtfCKrgzbXoUI4bRQ0x89jzipvxAqBC2VQwuqP1dUAV6CtyW
	719SiOl67XWKWFE2W8GhVNJxcWmLB910xRU6A0M8V0CnEgA74LNLZGzLfOg5YULKThcMtsfKgyL
	DRynJ2j7g0Qi6Zmq+N7c3esGlgb9ruSnWM60HLI8MhNSxQjiUJEDrNS/QPYI7IvQlrI16/pePwT
	Sx7qE731Bap4mdh8KXs6XPVpvRzmU=
X-Received: by 2002:a05:7022:f519:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3c0312e9bmr2813250c88.20.1794422367224;
        Wed, 11 Nov 2026 10:39:27 -0800 (PST)
X-Received: by 2002:a05:7022:f519:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3c0312e9bmr2813221c88.20.1794422366523;
        Wed, 11 Nov 2026 10:39:26 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm16392776c88.6.2026.11.11.10.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:39:26 -0800 (PST)
Date: Wed, 11 Nov 2026 10:39:20 -0800
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261111103920.00004f75@oss.qualcomm.com>
In-Reply-To: <avRANKPwp-r-QSR4@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261110163809.000070d6@oss.qualcomm.com>
	<avRANKPwp-r-QSR4@pluto>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af4b660 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=XOA6F6MpoYfF4Vds9coA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 02eDL7EteslhQUuFyOIzjWligoL8ci_6
X-Proofpoint-ORIG-GUID: 02eDL7EteslhQUuFyOIzjWligoL8ci_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX2bG4h6J0zXKp
 WVd2BFB30sGoEi4EyctTjgPN/DcfpB4XMprYTsKa8f+M+TiSUxkOE7yH+mS8fJVb1F8X14QEch8
 O5h9/plHVUeU/2BMigAABwYkfqEQZA0MKL0RdbtU2cCOqarXULbUCfkNVdPvkGQuXegFADup6hc
 aR6WMvTQQX3bupaOsIy3XtiK0tAns5v8T9EJhyKrGXWuwDLq8K7NUkLI+FuFgJUYFlsRczByL7w
 LiOvn6hei2B0qIOeKiiUTUscn2EJDH49InjnyzySkRIgX6Nc+LuEyIjR4Akkwhu+m/X6DO7Wuyx
 bnTRe8/eKP5SJMfUFGpZplfmGDgqtRu6FDHpZtLyxA7a2KITmXQEG90bXMhPnrZ0qdPz782AddU
 nkTnz23dcghA7PWlK4io0hpw8YB9Ml8VGrimOrRM+z+aGRqA4pzsn9XP/25WDJCSK+kwilm+AKo
 PDTxh6Je/bS4zgMpFpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX+pe1GlZ40xu3
 DO8nMaHat46GcDHiuV/lo2E5vob0GeSo+BPZkEpMvw149Fzw2sMSigQJbnrmetVQGyUnuk6o88f
 CGRmLk52Grv5EMRcQldtpSw5eFgpMfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_103929_002729_CF691E2E 
X-CRM114-Status: GOOD (  52.48  )
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

On Wed, 11 Nov 2026 10:15:16 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> On Tue, Nov 10, 2026 at 04:38:09PM -0800, Jonathan Cameron wrote:
> > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > > dedicated to System Telemetry.
> > >   
> > 
> > Hi Cristian,  
> 
> Hi Jonathan,
> 
> thanks for your time...I sincerely hope you're travelling abroad on some
> remote timezone given the time these reviews came in :D

I'm based in Pacific time these days so was only 4pm ;)

> 
> > 
> > So, the main issue here is pretty much summarized by:
> > 
> >  28 files changed, 12801 insertions(+), 99 deletions(-)
> > (obviously there are tests etc, but it's still > 10k lines)
> >  
> 
> Usually I try to implement the complete set of features of a new protocol
> but indeed this new Telemetry thing is huge by itself so it became quickly
> overwhelming to review...imagine to code and test it.
> 
> > There are relatively few reviewers who would even consider taking that on.
> > I foolishly thought it wouldn't be too bad (and I review a lot of code).
> > By about 3/4 of the way though, probably much earlier, I know the quality
> > of review went down considerably. Honestly it was probably a waste of
> > time continuing but I'm stubborn like that.
> > 
> > So, unless you have a path to bribing or sweet talking various folk to
> > deal with reviewing this with each having to set aside multiple days
> > to do it, likely repeating for a couple of versions yet, I think you've
> > got to figure out out how to make the first patch set more manageable.
> > Probably don't split it up as much as the mpam or CCA folk have had to,
> > but you have a lot of colleagues who are experiencing the same problem
> > at the moment. They may be able to advise.
> > 
> > So it would be nice if what was in that first patch set was 'functional'
> > but I don't think it needs to function on every systems or support more
> > than an absolutely minimal feature set.  Just fail to probe when you see
> > something that isn't supported by that minimal set if that means
> > the thing won't be functional.
> > 
> > Once that's in place, over a couple of additional patch sets you can
> > get to everything you have here.
> > 
> > So what if you choose one data path (shmti perhaps), no notifications,
> > events, maybe even simplify to one of the readback paths.
> > Maybe even drop event groups initially.   
> 
> Based on our real world initial customer of this I can certainly drop a
> few features that are not supported anyway by the real FW and move it to
> a later patchset, stuff like groups, notifications and single sample
> reads, but all of the rest is hardly removable while keeping the system
> functional and usable.

For purposes of upstream. I'm not sure we care if a particular implementation
is useable with the feature set initially supported.  We just care if
there is a path to test the subset supported (hacks / emulation, whatever is fine).

> 
> > Possibly even drop timestamps.  Definitely drop things like boot-on
> > support and debugfs (unless you are using that as a cheeky 'functional'
> > test ahead of the main userspace interface.  
> 
> Not sure what you mean by drop timestamps, definitelly cannot drop
> boot-on (it is how systems are configured indeed) neither debugfs used
> for bring-up and FW debug.

Timestamp variety is complex. Fairly sure you are allowed to report no
timestamps at all as one option. If you pretend they all look like that
initially it might bring some simplifications. Anyhow, you know this
code better than I do, so maybe that is harder than I'm thinking.

I'd still push boot-on out for a follow on patch set.  Sure can
aim to land that one quickly! Sure customers will
get irritated by lack of support for what they have. Taking equivalent
of MPAM.  The initial support for that covered pretty much nothing on
real platforms. Customers were (and still are) irritated. But that
allowed progress in the right direction.

> 
> > 
> > How much would that slim things down?  It doesn't even have to be
> > useful, just testable.  Realistically I think the hope of getting
> > enough review doubles if you can halve the size of what you are asking
> > people to look at.  
> 
> I am not sure how many lines I can shed with the above features drops but
> I'll give it a go anyway at slimming down the series after I have gone
> through this round of Sashiko pains.

If we have to fallback to breaking it into steps that don't do much
more than print a message to say 'stuff found' then do that. It's ugly
but MPAM did that, RME is doing that. No one likes dead code, but it
does allow progress to be made.  Ideal is end to end with subset of
features then add features but not always achievable.

Normal rule of thumb for landing a feature is sub 2k lines of code
because that is about what a reviewer can digest in one go.

Very rare anything above 5k makes progress. As Sudeep mentioned, a
lot of folk will open the cover letter, see loc and close it again unread.

Jonathan


